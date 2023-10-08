extends CSGMesh3D

@onready var GameScript = $"../../Interface"
# Called when the node enters the scene tree for the first time.

func _ready():
	GameScript.houselimitadd(2)
	GameScript.remove_electricity(5)
	pass # Replace with function body.


