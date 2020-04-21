extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	#$".".translate(Vector2(400, 400))
	#$".".draw_circle(Vector2(0, 0), 200, Color(255, 255, 255, 255))
	$".".linear_velocity += Vector2(200, 0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
