extends Control

@onready var Earth = $Label/Label/Earth
@onready var GameScript = $".."

var degx = 0
var degy = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func getday(day):
	print(day)
	Earth.position.x = sin(deg_to_rad(day*0.98))*120+240
	Earth.position.y = cos(deg_to_rad(day*0.98))*120+140
	pass
