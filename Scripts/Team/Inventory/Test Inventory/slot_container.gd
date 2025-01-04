class_name Slot
extends PanelContainer

@export var slotItemResource: Item = null
@onready var texture_rect: TextureRect = %TextureRect
@onready var label: Label = %Label

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

func _get_drag_data(_at_position):
	if not slotItemResource:
		return
	
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = %TextureRect.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(49, 49)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	
	return self

func _can_drop_data(_at_position, _data):
	return _data is Slot

func _drop_data(_at_position, data):
	if slotItemResource == null:
		set_item(data.slotItemResource)
		data.set_data_empty()
	else:
		var temp := slotItemResource
		set_item(data.slotItemResource)
		data.set_item(temp)
