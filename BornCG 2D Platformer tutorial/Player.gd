 extends KinematicBody2D

var velocity = Vector2(0, 0)
#var indle_iteration = 0

func _physics_process(delta):
	
	if Input.is_action_pressed("right"):
		velocity = Vector2(120, 0)
#		print("GOING RIGHT")
#		indle_iteration = 0
	elif Input.is_action_pressed("left"):
		velocity = Vector2(-120, 0)
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
	
	move_and_slide(velocity)
