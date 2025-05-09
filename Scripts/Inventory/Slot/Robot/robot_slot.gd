extends InventorySlot

@onready var parent_inventory: RobotInventory = (self.get_parent()).get_parent()
@onready var slot_container: GridContainer = %SlotContainer
@onready var texture_rect: TextureRect = $ItemImage
@onready var label: Label = $ItemName

@export var slot_position: int = 0

var data_item: Item

func _get_drag_data(at_position: Vector2) -> Variant:
	if !data_item: return
	_mouse_preview()
	return self

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is not Object:
		return false
		
	return true

func _drop_data(at_position: Vector2, dataResource: Variant) -> void:
	var draged_data: Item = dataResource.data_item
	var item_added = parent_inventory.addItem(slot_container, draged_data, slot_position)
	#data_item = dataResource.data_item #
	dataResource.loadData()
	#if item_added:
	#else:
		#return
	#loadData()
	#parent_inventory.assignToSlot(slot_container)

func loadData() -> void:
	if data_item:
		texture_rect.texture = data_item.texture
		label.text = str(data_item.quantity)
	else:
		texture_rect.texture = null
		label.text = ''
		return
	
	if data_item.quantity <= 0:
		texture_rect.texture = null
		label.text = ''
		parent_inventory.remove_item(slot_position)

func _mouse_preview() -> void:
	var preview_texture: TextureRect = TextureRect.new()
	preview_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_texture.size = Vector2(40, 40)
	preview_texture.texture = texture_rect.texture
	
	var item_preview: Control = Control.new()
	item_preview.add_child(preview_texture)
	set_drag_preview(item_preview)
