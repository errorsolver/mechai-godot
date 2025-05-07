extends Control

@export var Items: Array[Item] = []

@onready var slot_container: GridContainer = self.find_child('PlayerSlotContainer')

signal refresh_inventory

func _ready() -> void:
	_assignToSlot()
	Items.resize(slot_container.get_child_count())

func _assignToSlot() -> void:
	if !Items:
		return
	
	var slots = slot_container.get_children()
	var i: int = 0
	for item: Item in Items:
		if item == null:
			continue
		
		var slot = slots[i]
		if slot:
			slot.dataItem = item
			slot.loadData()
			i += 1

func addItem(drag_item: Item, pos: int) -> bool:
	var item_duplicate: Item = drag_item.duplicate(true)
	
	item_duplicate.quantity = 1
	if Items[pos] and item_duplicate.name == Items[pos].name:
		Items[pos].quantity += 1
	elif Items[pos]:
		return false
	else:
		return false
	
	drag_item.quantity -= 1
	_assignToSlot()
	emit_signal("refresh_inventory")
	return true
