extends Node
@onready var GameScript = $"../../Interface"
# Called when the node enters the scene tree for the first time.


func _ready():
	GameScript.moreelectricity(5)
	
	pass # Replace with function body.

var coord = Vector3()
var futurecoord = Vector3()

func create(position):
	coord = position
	self.position.y -= 2
	coord.y -= 2
	futurecoord = coord + Vector3(0, 2, 0)
	print(coord)
	print(futurecoord)

func _process(delta):
	if self.position.y < futurecoord.y:
		self.position = self.position.lerp(futurecoord, delta * 0.5)
