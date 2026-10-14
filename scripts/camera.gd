extends Camera2D

@export var player: CharacterBody2D
var highest_y: float
var platform_position

func _ready() -> void:
	highest_y = global_position.y

func _process(_delta: float) -> void:
	if player.global_position.y < highest_y:
		highest_y = player.global_position.y
		platform_position = highest_y - 200
		global_position.y = highest_y
	if player.global_position.y > highest_y + 345:
		Gamemanager.restart()
