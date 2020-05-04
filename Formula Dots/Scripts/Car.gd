extends RigidBody2D

var SCALE = 100
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var colors_array = [Color("ff0000"), Color("001aff"), Color("f7ff00"), Color("08ff00")]
var screen_size

var acceleration = 0	#acceleratino in meters per second squared
var breaking = 0	#breaking in meters per second squared
var speed = 0	#speed in meters per second
var max_speed = 33*SCALE
var direction = Vector2(0, 0)	#direction vetor
var velocity = Vector2(0, 0)	#velocity vector


func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(300, 300)
	
	randomize()
	var new_color = Color(randf(), randf(), randf())
	$"Outer Color".self_modulate = new_color
	print(new_color)
	print($"Outer Color".self_modulate)
	
	direction = Vector2(1, 0)
	acceleration = 10*SCALE
	breaking = 50*SCALE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	direction = Vector2(randf(), randf())

	if speed != max_speed:
		speed += acceleration * delta

	velocity.x = direction.x * speed
	velocity.y = direction.y * speed

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

