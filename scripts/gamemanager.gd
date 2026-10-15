extends Node


var score
var high_score:int = 0
var new_platform
var dead:bool = false


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true
	
func _input(event: InputEvent) -> void:
	var UI = get_tree().current_scene.get_node("UI")
	if Input.is_action_just_pressed("unpause"):
		unpause()
		UI.in_game()
	

func restart():
	var UI = get_tree().current_scene.get_node("UI")
	if score > high_score:
		high_score = score
	pause()
	get_tree().call_deferred("reload_current_scene")
	dead = false
	
func pause():
	get_tree().paused = true
func unpause():
	get_tree().paused = false
	
