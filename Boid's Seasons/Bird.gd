extends RigidBody2D


var velocity = Vector2(0, 0)
var direction = Vector2(0, 0)
var speed = 0

var fov = 360.0	# Field of view in degrees, MUST be between 0 and 360 and it determines how aware of it's surrounding the bird is.
var rov = 120	# Range of view

var followList = []
var debugMode = false
var screen_rectagle


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_rectagle = get_viewport_rect().size
#	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var gravity_center = Vector2(0, 0)
	var vector_to_gravity_center = Vector2(0, 0)

	if(followList.size() != 0):
		gravity_center = followList[0].position
		for i in followList:
			gravity_center.x = (gravity_center.x + followList[i].position.x) / 2
			gravity_center.y = (gravity_center.x + followList[i].position.y) / 2
	
	vector_to_gravity_center = vector_to_gravity_center.direction_to(gravity_center)

	velocity = velocity.linear_interpolate(vector_to_gravity_center, 0.3)
	position = position + velocity * delta
	rotation = velocity.normalized().angle() + deg2rad(90)


func _draw():
	if(debugMode):
		for i in range(360/45):
			draw_arc(Vector2(0, 0), 150, deg2rad(i * 45), deg2rad(i * 45 + 45/2), 40, Color(1, 1, 1), 0.2, false)



func _on_Area2D_body_entered(body):
	followList.append(body)


func _on_Area2D_body_exited(body):
	followList.remove(followList.find(body))
