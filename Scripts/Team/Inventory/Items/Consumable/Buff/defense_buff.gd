class_name DefenseBuff
extends Item

@export var extra_defense: int = 1
@export var max_turn: int = 3

func _ready() -> void:
	isStackable = true
	isConsumable = true
	isEquipable = false

func buff() -> Array[int]:
	return [extra_defense, max_turn]
