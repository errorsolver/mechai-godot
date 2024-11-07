extends Node2D

class_name UIControl
signal selected_action(value:String)
signal mouse_entered(condition:bool)
signal mouse_entered_each_option(condition:bool)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	var control = get_parent()
	if control :
		connect("mouse_entered_each_option",Callable(control,"_on_pointer_each_option"))
		connect("selected_action",Callable(control,"_on_pointer_selected_action"))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_attack_input_option(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left-click"):
			selected_action.emit("attack")
			


func _on_move_input_option(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left-click"):
			selected_action.emit("move")
		

func _on_skill_input_option(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left-click"):
			selected_action.emit("skill")
			


func _on_mouse_enter_move():
	pass # Replace with function body.
	$move.scale *= 1.3 
	mouse_entered_each_option.emit(true)
	


func _on_mouse_exit_move():
	pass # Replace with function body.
	$move.scale /= 1.3
	mouse_entered_each_option.emit(false)
	


func _on_mouse_enter_attack():
	pass # Replace with function body.
	$attack.scale *= 1.3
	mouse_entered_each_option.emit(true)
	


func _on_mouse_exit_attack():
	pass # Replace with function body.
	$attack.scale /= 1.3
	mouse_entered_each_option.emit(false)
	

func _on_mouse_enter_skill():
	pass # Replace with function body.
	$skill.scale *= 1.3
	mouse_entered_each_option.emit(true)
	

func _on_mouse_exit_skill():
	pass # Replace with function body.
	$skill.scale /= 1.3
	mouse_entered_each_option.emit(false)
	




#
#func _on_input_event(viewport, event, shape_idx):
	#if event is InputEventMouseMotion:
		#mouse_entered.emit(true)
