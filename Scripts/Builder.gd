extends Node3D
@onready var selector = $CharacterBody3D
@onready var camera = $"../CameraNode/Camera3D"
@onready var model = $CharacterBody3D/CSGMesh3D
@onready var GameScript = $"../Interface"

@onready var Scenes = [load("res://Resources/Models/PlaceableModels/Solarpanel/SolarPanels.tscn"), 
load("res://Resources/Models/PlaceableModels/Greenhouse/Greenhouse.tscn"),
load("res://Resources/Models/PlaceableModels/Cave/Cave.tscn"),
load("res://Resources/Models/PlaceableModels/Factory/Factory.tscn"),
load("res://Resources/Models/PlaceableModels/Houses/2people/2House.tscn"),
load("res://Resources/Models/PlaceableModels/Houses/4People/4House.tscn"),
load("res://Resources/Models/PlaceableModels/Houses/6people/6People.tscn"),
load("res://Resources/Models/PlaceableModels/Windmill/Windmill.tscn")]

@onready var modelsarray = [load("res://Resources/Models/PlaceableModels/Solarpanel/Solarpanel.obj"), 
load("res://Resources/Models/PlaceableModels/Greenhouse/Greenhouseobject.obj"),
load("res://Resources/Models/PlaceableModels/Cave/Cave.obj"),
load("res://Resources/Models/PlaceableModels/Factory/Factory.obj"),
load("res://Resources/Models/PlaceableModels/Houses/2people/2people.obj"),
load("res://Resources/Models/PlaceableModels/Houses/4People/4people.obj"),
load("res://Resources/Models/PlaceableModels/Houses/6people/6people.obj"),
load("res://Resources/Models/PlaceableModels/Windmill/Windmill.obj")]

var modelsnames = ["SolarPanels", "Greenhouse", "Cave", "Factory", "base2", "base4", "base6", "Windmill"]

var current = 0
var alreadyplaced = false
# Called when the node enters the scene tree for the first time.
func _ready():
	changemodel()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Interact"):
		canIplace()
		
	if Input.is_action_just_pressed("MouseWheelUp"):
		if current >= Scenes.size()-1:
			current = 0
		else:
			current += 1
		changemodel()
			
	if Input.is_action_just_pressed("MouseWheelDown"):
		if current <= 0:
			current = Scenes.size()-1
		else:
			current -= 1
		changemodel()

func changemodel():
	GameScript.resourcesneeded(modelsnames[current])
	model.mesh = modelsarray[current]
	pass

func canIplace():
	if GameScript.canplace(modelsnames[current]):
		alreadyplaced = true
		var scenetoload = Scenes[current].instantiate()
		scenetoload.position = selector.position
		#scenetoload.look_at_from_position(selector.position, camera.global_position, Vector3.UP)
		print(camera.global_position)
		get_node("../PlacedStructures").add_child(scenetoload)
	else:
		pass
