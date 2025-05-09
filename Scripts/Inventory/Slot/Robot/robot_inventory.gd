class_name RobotInventory
extends Inventory

#@export var Items: Array[Item] = []

@onready var robot_slot_container: GridContainer = self.get_node_or_null("SlotContainer")
@onready var player_inventory: Node = self.get_parent().get_node('PlayerInventory')

var totalSlot: int = 0

#func _init() -> void:
	#super(item_arr, robot_slot_container)

func _ready() -> void:
	totalSlot = robot_slot_container.get_child_count()
	Items.resize(get_node('SlotContainer').get_child_count())
	if player_inventory:
		player_inventory.refresh_inventory.connect(Callable(self, "assignToSlot"))

func getItems() -> Array[Item]:
	return Items

func addItem(slot_container, drag_item: Item, pos: int) -> bool:
	var item_duplicate: Item = drag_item.duplicate(true)
	item_duplicate.quantity = 1
	
	if Items[pos] and item_duplicate.name == Items[pos].name:
		Items[pos].quantity += 1
	elif Items[pos]:
		return false
	else:
		Items[pos] = item_duplicate
	
	drag_item.quantity -= 1
	#assignToSlot(Items, robot_slot_container)
	assignToSlot(slot_container)
	return true

func remove_item(index: int) -> void:
	Items[index] = null

func assignToSlot(slot_container) -> void:
	for i in range(totalSlot):
		if Items[i] == null:
			continue
		
		if Items[i].quantity <= 0:
			remove_item(i)
		
		slot_container.get_child(i).data_item = Items[i]
		slot_container.get_child(i).loadData()
