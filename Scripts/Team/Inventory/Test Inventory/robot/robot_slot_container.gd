class_name Slot
extends PanelContainer

#signal isDroped

@export var slotItemResource: Item = null
@onready var texture_rect: TextureRect = %TextureRect
@onready var label: Label = %Label
#@onready var player_inventory: PanelContainer = $Player_Inventory

#var itemArray

var tween: Tween

func _process(delta: float) -> void:
	var dropped = get_viewport().gui_is_drag_successful()

func set_item(item_resource: Item) -> void:
	slotItemResource = item_resource
	texture_rect.texture = slotItemResource.texture
	texture_rect.tooltip_text = slotItemResource.description
	texture_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	label.text = str(slotItemResource.quantity)

func set_data_empty() -> void:
	texture_rect.texture = null
	texture_rect.tooltip_text = ""
	slotItemResource = null
	label.text = ""

func _get_drag_data(_at_position: Vector2):
	if not slotItemResource:
		return
	
	if isZero(slotItemResource.quantity):
		return
	
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = %TextureRect.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(49, 49)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	
	return self

func _can_drop_data(_at_position: Vector2, _data: Variant):
	return _data is PlayerSlot or Slot

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	data.slotItemResource.quantity -= 1
	if slotItemResource == null:
		var test = data.duplicate()
		set_item(test.slotItemResource)
		if data is Slot:
			data.set_data_empty()
	else:
		if data is PlayerSlot:
			return
			
		var label_text = data.get_node('%Label')
		var temp := slotItemResource
		
		if isZero(temp.quantity):
			return
		
		set_item(data.slotItemResource)
		data.set_item(temp)

func danger_notif() -> void:
	tween = get_tree().create_tween()
	tween.tween_property(texture_rect, "modulate", Color.INDIAN_RED, 0.2)
	tween.tween_property(texture_rect, "modulate", Color(1, 1, 1, 1), 0.4)

func isZero(data: Variant) -> bool:
	if data <= 0:
		danger_notif()
		return true
	return false
