extends PanelContainer

@export var inventoryName: String = ''
@export var itemArray: Array[Item] = []
@export var tmpItemArray: Array[Item] = []

@onready var inventory = Inventory.new()
@onready var grid_container = %GridContainer

var isFirstTime: bool=true

func _ready() -> void:
	if self.has_node('%Title'):
		%Title.text = inventoryName
	
	update_inventory_ui()
	tmpItemArray = itemArray.duplicate()
	isFirstTime = false

func _process(delta: float) -> void:
	if tmpItemArray != itemArray:
		print(inventoryName, ' changed')
		tmpItemArray = itemArray.duplicate()

func update_inventory_ui() -> void:
	for item in itemArray:
		for child in grid_container.get_children():
			if not isFirstTime and child.slotItemResource.name == item.name:
				child.set_item(item)
				break
			if child is PlayerSlot and child.slotItemResource == null:
				
				child.set_item(item)
				break
		print('item: ',item.str())

func _on_robot_inventory_1_added_item() -> void:
	print('_on_robot_inventory_1_added_item')
	update_inventory_ui()
