extends Node
@onready var GameScript = $"../../Interface"

# Called when the node enters the scene tree for the first time.
func _ready():
	GameScript.updateelectricity()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
