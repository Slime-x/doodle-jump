extends CharacterBody2D
@onready var camera: Camera2D = $"../Camera2D"


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jumping
var idle
var highest_y = 0
var restarting = false
@export var start_position = Vector2(307,26)

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
	
	
	
	#if velocity.y < 0:
		#camera.position_change(position.y)
		

	move_and_slide()

func restart():
	get_tree().reload_current_scene()
	
