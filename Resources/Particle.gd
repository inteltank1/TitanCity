extends Node3D

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$CPUParticles3D.emitting = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	
	if time >= 3:
		get_parent().remove_child(self)
	pass
