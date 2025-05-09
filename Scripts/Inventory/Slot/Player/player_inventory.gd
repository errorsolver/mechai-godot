class_name PlayerInventory
extends Inventory

@onready var player_slot_container: GridContainer = self.find_child('SlotContainer')

signal refresh_inventory

func _ready() -> void:
	assignToSlot(player_slot_container)
	
	for i in Items:
		print(i)
	
	#print('item: ', Items)
	#Items.resize(player_slot_container.get_child_count())

func assignToSlot(slot_container) -> void:
	if !Items:
		return
	
	var slots = slot_container.get_children()
	var i: int = 0
	for item: Item in Items:
		if item == null:
			continue
		
		var slot = slots[i]
		if slot:
			slot.data_item = item
			slot.loadData()
			i += 1

func addItem(slot_container, drag_item: Item, pos: int) -> bool:
	var item_duplicate: Item = drag_item.duplicate(true)
	item_duplicate.quantity = 1
	
	if Items[pos] and item_duplicate.name == Items[pos].name:
		Items[pos].quantity += 1
	elif Items[pos]:
		return false
	else:
		return false
	
	drag_item.quantity -= 1
	#assignToSlot(Items, player_slot_container)
	assignToSlot(slot_container)
	emit_signal("refresh_inventory")
	return true
