extends PanelContainer

@export var inventoryName: String = ''
@export var itemArray: Array[Item]

@onready var grid_container = %GridContainer

func _ready() -> void:
	if self.has_node('%Title'):
		%Title.text = inventoryName
