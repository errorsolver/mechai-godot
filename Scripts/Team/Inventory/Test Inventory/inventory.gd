class_name Inventory
extends Node

signal addedItem
@export var inventoryName: String = ''
@export var itemArray: Array[Item] = []
@export var tmpItemArray: Array[Item] = []
@export var max_slots: int = 10
@onready var title: Label = %Title

@onready var grid_container = %GridContainer

var maxArray = 10

func _ready() -> void:
	title.text = inventoryName
	itemArray.resize(max_slots)
	tmpItemArray.resize(max_slots)
	
func _process(delta: float) -> void:	
	var child = grid_container.get_children()
	for i in range(maxArray):
		itemArray[i] = child[i].slotItemResource
		
	var is_identical = true
	for i in range(itemArray.size()):
		if itemArray[i] != tmpItemArray[i]:
			is_identical = false
	if is_identical:
		pass
	else:
		print('self: ',self)
		emit_signal("addedItem")
	
	tmpItemArray = itemArray.duplicate(true)
		
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
