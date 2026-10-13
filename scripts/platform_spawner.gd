extends Node

@onready var timer: Timer = $Timer
@onready var camera: Camera2D = $"../Camera2D"

@onready var platform_scene = preload("res://scenes/platform_3.tscn")

func _ready() -> void:
	var y = 150
	for i in range(5):
		var new_platform = platform_scene.instantiate()
		new_platform.position = Vector2(randi_range(80,530), y)
		get_parent().get_node("platforms").add_child(new_platform)
		y -= 150
func spawn():
	var new_platform = platform_scene.instantiate()
	new_platform.position = Vector2(randi_range(80,530), camera.highest_y + 50)
	get_parent().get_node("platforms").add_child(new_platform)
	

func _on_timer_timeout() -> void:
	spawn()
