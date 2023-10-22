extends CSGMesh3D

@onready var GameScript = $"../../Interface"
# Called when the node enters the scene tree for the first time.

func _ready():
	$AnimationPlayer.play("WingsMoving")
	$AnimationPlayer.advance(randf_range(1, 5))
	GameScript.moreelectricity(10)
	pass # Replace with function body.
	

var coord = Vector3()
var futurecoord = Vector3()

func create(position):
	coord = position
	self.position.y -= 5
	coord.y -= 5
	futurecoord = coord + Vector3(0, 5, 0)
	print(coord)
	print(futurecoord)

func _process(delta):
	if self.position.y < futurecoord.y:
		self.position = self.position.lerp(futurecoord, delta * 0.5)
