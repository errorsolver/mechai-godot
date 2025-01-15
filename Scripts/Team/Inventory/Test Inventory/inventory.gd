class_name Inventory
extends Node

@export var inventoryName: String = ''
@export var itemArray: Array[Item] = []
@export var tmpItemArray: Array[Item] = []
@export var max_slots: int = 10

@onready var grid_container = %GridContainer

func _ready() -> void:
	itemArray.resize(max_slots)
	print('Inventory array size: ', itemArray.size())
	print('Inventory item list: ', list_items())

func _process(delta: float) -> void:
	if tmpItemArray != itemArray:
		print(inventoryName, 'changed')
		tmpItemArray = itemArray
		
func add_item(item: Item) -> bool:
	if itemArray.size() < max_slots:
		itemArray.append(item)
		print("Item added: ", item.item_name)
		return true
	else:
		print("Inventory full! Cannot add item: ", item.item_name)
		return false

func remove_item(item: Item) -> bool:
	if item in itemArray:
		itemArray.erase(item)
		print("Item removed: ", item.item_name)
		return true
	else:
		print("Item not found: ", item.item_name)
		return false

func list_items():
	print("Inventory List:")
	#for i in itemArray:
		#print("- ", i.item_name, " (Value: " i.item_value, ")")
