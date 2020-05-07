 extends KinematicBody2D

var velocity = Vector2(0, 0)
const SPEED = 180
const GRAVITY = 25
const JUMP_HEIGHT = -500
const UP_DIRECTION = Vector2.UP

#var indle_iteration = 0

func _physics_process(delta):
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
#		print("GOING RIGHT")
#		indle_iteration = 0
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
#		print("GOING LEFT")
#		indle_iteration = 0
#	elif(Input.is_action_pressed("ui_up")):
#		velocity = Vector(-1, 0)
#	elif(Input.is_action_pressed("ui_down")):
#		velocity = Vector(-1, 0)
	else:
		velocity.x = lerp(velocity.x, 0, 0.2)
#		indle_iteration += 1
#		print("INDLEING ", indle_iteration)
	
	if Input.is_action_just_pressed("up") and $".".is_on_floor():
		velocity.y = JUMP_HEIGHT
#		velocity.y = lerp(velocity.y, JUMP_HEIGHT, 0.34)
	
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, UP_DIRECTION)
	
#	if $".".is_on_floor():
#		velocity.y = 0
