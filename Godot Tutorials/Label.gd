extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var process_frames = 0
var physics_frames = 0
var process_time = 0
var physics_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	process_frames += 1
	process_time += delta
	text = str("\tFRAMES\nProcess: ", process_frames, "\nPhysics: ", physics_frames, "\n\n\tTIME\nProcess: ", process_time, "\nPhysics: ", physics_time)

func _physics_process(delta):
	physics_frames += 1
	physics_time += delta
	text = str("\tFRAMES\nProcess: ", process_frames, "\nPhysics: ", physics_frames, "\n\n\tTIME\nProcess: ", process_time, "\nPhysics: ", physics_time)
