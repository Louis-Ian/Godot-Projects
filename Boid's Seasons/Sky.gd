extends Node2D


export (PackedScene) var Bird
var flockSize = 2
var maxSpeed = 300
var screenSize


# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size
	
	randomize()
	
	for i in range(flockSize):
		var bird = Bird.instance()
		add_child(bird)
		bird.position = Vector2(rand_range(20, screenSize.x - 20), rand_range(20, screenSize.y - 20))
		bird.linear_velocity = Vector2(rand_range(-maxSpeed, maxSpeed), rand_range(-maxSpeed, maxSpeed))
		bird.debugMode = false
		bird.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
