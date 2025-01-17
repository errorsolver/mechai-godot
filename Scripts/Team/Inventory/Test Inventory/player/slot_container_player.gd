class_name PlayerSlot
extends PanelContainer

@export var slotItemResource: Item = null
@onready var texture_rect: TextureRect = %TextureRect
@onready var label: Label = %Label

var tween: Tween

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
	#print('_get drag data')
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
	
	#slotItemResource.quantity -= 1
	
	return self

#func _can_drop_data(_at_position: Vector2, _data: Variant):
	#print('can drop data')
	#print("Data slot: ", _data)
	#return _data is PlayerSlot

func danger_notif() -> void:
	tween = get_tree().create_tween()
	tween.tween_property(texture_rect, "modulate", Color.INDIAN_RED, 0.2)
	tween.tween_property(texture_rect, "modulate", Color(1, 1, 1, 1), 0.4)

func isZero(data: Variant) -> bool:
	if data <= 0:
		danger_notif()
		return true
	return false
