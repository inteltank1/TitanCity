extends CSGMesh3D

@onready var GameScript = $"../../Interface"
# Called when the node enters the scene tree for the first time.

func _ready():
	GameScript.houselimitadd(6)
	GameScript.remove_electricity(15)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

var coord = Vector3()
var futurecoord = Vector3()

func create(position):
	coord = position
	self.position.y -= 4
	coord.y -= 4
	futurecoord = coord + Vector3(0, 4, 0)
	print(coord)
	print(futurecoord)

func _process(delta):
	if self.position.y < futurecoord.y:
		self.position = self.position.lerp(futurecoord, delta * 0.5)
