extends PanelContainer

@onready var robot_inventory: Control = (self.get_parent()).get_parent()
@onready var texture_rect: TextureRect = $ItemImage
@onready var label: Label = $ItemName

@export var slot_position: int = 0

var dataItem: Item

func _get_drag_data(at_position: Vector2) -> Variant:
	_mouse_preview()
	return self

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is not Object:
		return false
		
	return true

func _drop_data(at_position: Vector2, dataResource: Variant) -> void:
	var draged_data: Item = dataResource.dataItem
	var item_added = robot_inventory.addItem(draged_data, slot_position)
	dataResource.loadData()

func loadData() -> void:
	if dataItem:
		texture_rect.texture = dataItem.texture
		label.text = str(dataItem.quantity)
	else:
		texture_rect.texture = null
		label.text = ''

func _mouse_preview() -> void:
	var preview_texture: TextureRect = TextureRect.new()
	preview_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_texture.size = Vector2(40, 40)
	preview_texture.texture = texture_rect.texture
	
	var item_preview: Control = Control.new()
	item_preview.add_child(preview_texture)
	set_drag_preview(item_preview)
