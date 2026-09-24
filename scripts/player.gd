extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jumping
var idle
@export var start_position = Vector2(70,20)

func _physics_process(delta: float) -> void:
	
	if is_on_floor():
		jumping = false
		velocity.y += -700
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		idle = true
	
	if is_on_floor() and idle:
		$AnimatedSprite2D.play("jump")
		idle = false
	if not is_on_floor() and not jumping:
		$AnimatedSprite2D.play("idle")
		jumping = true

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	if direction<0:
		$AnimatedSprite2D.flip_h = true
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.y > 2000:
		position = start_position
		velocity.y = 0

	move_and_slide()
