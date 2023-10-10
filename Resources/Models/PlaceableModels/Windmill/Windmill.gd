extends CSGMesh3D

@onready var GameScript = $"../../Interface"
# Called when the node enters the scene tree for the first time.

func _ready():
	$AnimationPlayer.play("WingsMoving")
	$AnimationPlayer.advance(randf_range(1, 5))
	GameScript.moreelectricity(10)
	pass # Replace with function body.
	
