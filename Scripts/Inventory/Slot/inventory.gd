class_name Inventory
extends Control

@export var Items: Array[Item] = []

#var Items: Array[Item] = []
#var slot_container: GridContainer
var total_slot

#func _init(items: Array[Item], slot_container: GridContainer) -> void:
	#self.Items = items
	#print(self.Items)
	#self.slot_container = slot_container

#func _ready() -> void:
	#print('item i ', Items)

#func _assignToSlot(Items: Array[Item], slot_container: GridContainer) -> void:
#func _assignToSlot(slot_container: GridContainer) -> void:
	#if !Items:
		#return
	#
	#var slots = slot_container.get_children()
	##print(slots)
	#var i: int = 0
	#for item: Item in Items:
		#if item == null:
			#continue
		#
		#var slot = slots[i]
		#if slot:
			#slot.dataItem = item
			#slot.loadData()
			#i += 1
#func assignToSlot() -> void:
	#for i in range(total_Slot):
		#if Items[i] == null:
			#continue
		#
		#if Items[i].quantity <= 0:
			#remove_item(i)
		#
		#robot_slot_container.get_child(i).dataItem = Items[i]
		#robot_slot_container.get_child(i).loadData()

func getItems() -> Array[Item]:
	return Items
