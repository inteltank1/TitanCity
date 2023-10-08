extends CSGMesh3D

@onready var GameScript = $"../../Interface"
# Called when the node enters the scene tree for the first time.

func _ready():
	GameScript.houselimitadd(4)
	GameScript.remove_electricity(10)
	pass # Replace with function body.


