extends Control
var time = 0

@onready var MainNode = $"../PlacedStructures"
var electricity = 0

@onready var DayText = $ColorRect/Day/DayText
var day = 0

@onready var FoodText = $ColorRect/Food/FoodText
var foodpercent = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	DayText.text = str(day)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if (time>=15):
		newday()
	pass

func newday():
	day += 1
	DayText.text = "Day " + str(day)
	time -= 15

func updateelectricity():
	electricity += 1
	print(electricity)
