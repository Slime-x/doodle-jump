extends ColorRect


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y > Gamemanager.new_platform + 1000:
		queue_free()
