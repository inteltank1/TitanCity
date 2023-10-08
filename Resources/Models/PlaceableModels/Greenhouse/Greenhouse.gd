extends Node
@onready var GameScript = $"../../Interface"
# Called when the node enters the scene tree for the first time.

func _ready():
	GameScript.foodmaker(5)
	GameScript.remove_electricity(10)
	pass # Replace with function body.


