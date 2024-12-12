@tool

class_name Equipment
extends Item

@export_group('Damage Reduction')
@export var DamageReduce: int = 0

func _ready() -> void :
	var block: int = Block('short', 10)
	print(block)

func Block(dmg_type: String, dmg_total: int) -> int :	
	return dmg_total - DamageReduce
