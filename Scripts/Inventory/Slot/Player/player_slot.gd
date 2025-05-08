extends InventorySlot

var dataItem: Item

@export var slot_position: int = 0

@onready var player_inventory: Control = $'../../'
@onready var texture_rect: TextureRect = $ItemImage
@onready var label: Label = $ItemName

func _get_drag_data(at_position: Vector2) -> Variant:
	if !dataItem: return
	if dataItem.quantity <= 0:
		return
	_mouse_preview()
	return self

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is not Object:
		return false
	if not dataItem:
		return false
	if data.dataItem.name == dataItem.name:
		return true
	return false

func _drop_data(at_position: Vector2, dataResource: Variant) -> void:
	var draged_data: Item = dataResource.dataItem
	player_inventory.addItem(draged_data, slot_position)
	dataResource.loadData()

func loadData() -> void:
	texture_rect.texture = dataItem.texture
	label.text = str(dataItem.quantity)

func _mouse_preview() -> void:
	var preview_texture: TextureRect = TextureRect.new()
	preview_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_texture.size = Vector2(40, 40)
	preview_texture.texture = texture_rect.texture
	
	var item_preview: Control = Control.new()
	item_preview.add_child(preview_texture)
	set_drag_preview(item_preview)
