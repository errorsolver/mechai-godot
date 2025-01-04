@tool

class_name Item
extends Resource

@export_group('Image')
@export var texture: CompressedTexture2D = null
@export_group('Property')
@export var name: String = ''
@export var description: String = ''
@export var quantity: int = 0
@export var isStackable: bool = false
@export var isConsumable: bool = false
@export var isEquipable: bool = false

func initAll(node: Node) -> void:
	if not node:
		print('no node')
		return
		
	for child in node.get_children():
		if child.name == 'Texture':
			child.texture = texture

func substract(totalUsed: int):
	quantity -= totalUsed
	
