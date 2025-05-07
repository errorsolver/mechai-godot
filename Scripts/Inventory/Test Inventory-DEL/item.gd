class_name ItemTest
extends Resource

var minImgSize: int = 32

@export_group('Image')
@export var texture: Texture = null
@export_group('Property')
@export var name: String = ''
@export var description: String = ''
@export var quantity: int = 1
@export var isStack: bool = false
@export var isConsumeable: bool = false
@export var isEquipable: bool = false
