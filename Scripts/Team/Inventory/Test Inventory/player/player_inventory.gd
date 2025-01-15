extends PanelContainer

@export var inventoryName: String = ''
@export var itemArray: Array[Item] = []
@export var tmpItemArray: Array[Item] = []

@onready var inventory = Inventory.new()
@onready var grid_container = %GridContainer

func _ready() -> void:
	if self.has_node('%Title'):
		%Title.text = inventoryName
		
	update_inventory_ui()

func _process(delta: float) -> void:
	if tmpItemArray != itemArray:
		print(inventoryName, 'changed')
		tmpItemArray = itemArray

func update_inventory_ui() -> void:
	var hitung = 1
	for item in itemArray:
		for child in grid_container.get_children():
			if child is PlayerSlot and child.slotItemResource == null:
				
				child.set_item(item)
				break
