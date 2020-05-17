 extends KinematicBody2D

var velocity = Vector2(0, 0)
const SPEED = 180
const GRAVITY = 25
const JUMP_HEIGHT = -800
const UP_DIRECTION = Vector2.UP

func _physics_process(delta):
	
	if Input.is_action_pressed("down") and is_on_floor():
		$AnimatedSprite.play("duck")
		velocity.x = lerp(velocity.x, 0, 0.08)
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
		if is_on_floor():
			$AnimatedSprite.play("walking")
			$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		if is_on_floor():
			$AnimatedSprite.play("walking")
			$AnimatedSprite.flip_h = true
	else:
		velocity.x = lerp(velocity.x, 0, 0.2)
		if is_on_floor():
			$AnimatedSprite.play("idle")
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_HEIGHT
		$AnimatedSprite.play("jumping")
	
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, UP_DIRECTION)
	
#	if $".".is_on_floor():
#		velocity.y = 0
