extends Node
@onready var GameScript = $"../../Interface"
# Called when the node enters the scene tree for the first time.

func _ready():
	GameScript.foodmaker(5)
	pass # Replace with function body.


