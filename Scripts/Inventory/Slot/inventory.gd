class_name Inventory
extends Control

@export var Items: Array[Item] = []

var total_slot: int

func getItems() -> Array[Item]:
	return Items
