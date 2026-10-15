extends Area2D
@onready var trampoline_: AudioStreamPlayer = $trampoline_


func _on_body_entered(body: CharacterBody2D) -> void:
	body.velocity.y = 0
	body.velocity.y -= 1400
	trampoline_.play()
