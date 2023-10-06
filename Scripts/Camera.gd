extends Node3D


var camera_position:Vector3
var camera_rotation:Vector3

@onready var selector = $"../BuilderNode/CharacterBody3D"
@onready var camera = $Camera3D

var rayorigin = Vector3()
var rayend = Vector3()
var result = Vector3()

func _ready():
	
	camera_rotation = rotation_degrees # Initial rotation
	
	pass

func _process(delta):
	
	# Set position and rotation to targets
		
	position = position.lerp(camera_position, delta * 8)
	rotation_degrees = rotation_degrees.lerp(camera_rotation, delta * 6)
	
	handle_input(delta)
	
	if result.collider_id == 26071794846:
		selector.position = selector.position.lerp(result.position, delta * 40)
	# Handle input

func handle_input(_delta):
	
	# Rotation
	
	var input := Vector3.ZERO
	
	input.x = Input.get_axis("camera_left", "camera_right")
	input.z = Input.get_axis("camera_forward", "camera_back")
	
	input = input.rotated(Vector3.UP, rotation.y).normalized()
	
	camera_position += input / 4
	
	# Back to center
	
	if Input.is_action_pressed("camera_center"):
		camera_position = Vector3()

func _input(event):
	
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("camera_rotate"):
			camera_rotation += Vector3(0, -event.relative.x / 10, 0)
	
	var space_state = get_world_3d().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	
	var origin = camera.project_ray_origin(mouse_position)
	var end = origin + camera.project_ray_normal(mouse_position) * 2000
	var query = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_areas = true
	result = space_state.intersect_ray(query)
	print(result.collider_id)
	
	
