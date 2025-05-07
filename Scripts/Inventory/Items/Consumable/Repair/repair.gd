class_name Repair
extends Item

@export var repaired_health: int = 5

func _ready() -> void:
	isStackable = true
	isConsumable = true
	isEquipable = false

func heal() -> int:
	return repaired_health
