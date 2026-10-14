extends Area2D

func _process(_delta: float) -> void:
	if position.y > Gamemanager.new_platform + 1000:
		queue_free()

func _on_body_entered(_body: Node2D) -> void:
	Gamemanager.restart()
