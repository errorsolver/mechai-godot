class_name Inventory
extends Node

signal addedItem
@export var inventoryName: String = ''
@export var itemArray: Array[Item] = []
@export var tmpItemArray: Array[Item] = []
@export var max_slots: int = 10


@onready var grid_container = %GridContainer

var maxArray = 10

func _ready() -> void:
	itemArray.resize(max_slots)
	tmpItemArray.resize(max_slots)
	
func _process(delta: float) -> void:
	#print('-----------------------------------')
	#print(itemArray)
	#print('-----------------------------------')
	
	var child = grid_container.get_children()
	for i in range(maxArray):
		itemArray[i] = child[i].slotItemResource
		#addedItem.emit()

	#print(tmpItemArray != itemArray)
	#if tmpItemArray != itemArray:
		#print(inventoryName, 'changed')
		#tmpItemArray = itemArray
		
	var is_identical = true
	for i in range(itemArray.size()):
		#print("cek array1: ", itemArray[i])
		#print("cek array2: ", tmpItemArray[i])
		if itemArray[i] != tmpItemArray[i]:
			#print("Perbedaan ditemukan di indeks:", i)
			is_identical = false
	if is_identical:
		pass
		#print("Array identik")
	else:
		emit_signal("addedItem")
		#print("Array berbeda")
	
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
	#for i in itemArray:
		#print("- ", i.item_name, " (Value: " i.item_value, ")")
