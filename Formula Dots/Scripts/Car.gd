extends RigidBody2D

var SCALE = 20

#var colors_array = [Color("ff0000"), Color("001aff"), Color("f7ff00"), Color("08ff00")]
var screen_size

var acceleration = 0	#acceleratino in meters per second squared
var breaking = 0	#breaking in meters per second squared
var speed = 0	#speed in meters per second
var max_speed = 22*SCALE	#max speed in meters per second, corrected to the scale of the sprite
var direction = Vector2(0, 0)	#direction vector
var velocity = Vector2(0, 0)	#velocity vector
var grip = 0.2	#grip level from 0 to 1


func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(200, 200)
	
	randomize()
	var new_color = Color(randf(), randf(), randf())
	$"Outer Color".self_modulate = new_color
	
	direction = Vector2(1, 0)
	direction = direction.normalized()
	acceleration = 10*SCALE
	breaking = 50*SCALE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	*** Testing the movement logic using random direction assignments
	var random_x_sign = random_negative_or_positive_sign()
	var random_y_sign = random_negative_or_positive_sign()
	var new_direction = Vector2(direction.x + random_x_sign * randf() * grip, direction.y + random_y_sign * randf() * grip)
	new_direction = new_direction.normalized()
	#direction = lerp(direction, new_direction, grip)
	direction = new_direction
	print(direction)
	
	if speed != max_speed:
		speed += acceleration * delta

	position += direction * speed * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

#Function that generates random sign (positive or negative)
func random_negative_or_positive_sign():
	var random_sign = rand_range(-1, 1)
	if random_sign < 0:
		return -1.0
	else:
		return 1.0
