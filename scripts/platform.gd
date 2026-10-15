extends AnimatableBody2D



func _process(delta: float) -> void:
	if position.y > Gamemanager.new_platform + 1000:
		queue_free()
