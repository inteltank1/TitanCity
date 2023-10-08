extends Control

@onready var Earth = $Label/Label/Earth
@onready var GameScript = $".."

var degx = 0
var degy = 0
var daysuntilarrival = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func getday(day):
	print(day)
	Earth.position.x = sin(deg_to_rad(day*0.98))*120+240
	Earth.position.y = cos(deg_to_rad(day*0.98))*120+140
	
	daysuntilarrival = ceil(deg_to_rad(day)*9)
	$Label/Label2/Label.text = "Estimated time until arrival: "+str(daysuntilarrival)+" days"
	print(daysuntilarrival)
	
	pass


func _on_accept_pressed():
	get_parent().remove_child(self)
	pass # Replace with function body.

func _on_cancel_pressed():
	get_parent().remove_child(self)
	pass # Replace with function body.
