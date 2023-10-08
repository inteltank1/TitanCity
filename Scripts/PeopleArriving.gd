extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func peoplearriving(people, day):
	$Label/Label/Label.text = str(people) + " new people are arriving in "+str(day)+" days!"



func _on_button_pressed():
	get_parent().remove_child(self)
	pass # Replace with function body.
