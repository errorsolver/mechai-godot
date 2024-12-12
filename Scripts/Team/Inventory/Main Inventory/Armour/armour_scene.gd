@tool

extends StaticBody2D

@export var helmet_stat: Resource

var i: int = 1

func _ready() -> void:
	%Material.texture = helmet_stat.texture
	#pass

func _process(delta: float) -> void:
	#print(Engine.is_editor_hint())
	
	if i <= 1:
		var block_value = helmet_stat.Block('short', 10)
		print("Block value in editor:", block_value)
		i += 1
