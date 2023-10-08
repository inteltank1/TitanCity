extends CSGMesh3D

@onready var GameScript = $"../../Interface"
# Called when the node enters the scene tree for the first time.

func _ready():
	GameScript.oxygenmaker(10)
	GameScript.remove_electricity(20)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
