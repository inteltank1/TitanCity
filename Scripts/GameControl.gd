extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func restartgame():
	remove_child($GameInstance)
	var instance = load("res://Map.tscn").instantiate()
	instance.name = "GameInstance"
	self.add_child(instance)
	
