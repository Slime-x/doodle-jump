extends Node
@onready var camera: Camera2D = $"../Camera2D"
@onready var platform_scene = preload("res://scenes/platform_3.tscn")
@onready var trampoline_scene = preload("res://scenes/trampoline.tscn")
@onready var enemy_scene = preload("res://scenes/enemy.tscn")

var highest_platform: float
var spawn_distance: float = 400
var min_gap: float = 80
var max_gap: float = 100
var platform_count = 0


func _ready() -> void:
	var y = 150
	for i in range(1):
		spawn_at(y)
		if i == 0:
			highest_platform = y
		else:
			min(highest_platform, y)
		y -= 100
		
		
func _process(_delta: float) -> void:
	if camera.global_position.y < highest_platform + spawn_distance:
		var platform_to_spawn = randi_range(2,3)
		
		for i in range(platform_to_spawn):
			var gap = randf_range(min_gap, max_gap)
			highest_platform -= gap
			spawn_at(highest_platform)


func spawn_at(y):
	var new_platform = platform_scene.instantiate()
	var new_trampoline = trampoline_scene.instantiate()
	var new_enemy = enemy_scene.instantiate()
	
	var x_position = randi_range(80, 530)
	
	new_platform.position = Vector2(x_position, y)
	get_parent().get_node("platforms").add_child(new_platform)
	
	new_enemy.position = Vector2(randi_range(80, 530), y - 200)
	if randi() % 100 + 1 > 95:
		new_trampoline.position = Vector2(x_position, y)
		get_parent().get_node("platforms").add_child(new_trampoline)	
		
	if randi() % 100 + 1 > 95:
		new_trampoline.position = Vector2(x_position, y)
		get_parent().get_node("platforms").add_child(new_enemy)
		
	
	

	
