extends Control
@onready var Package = load("res://Scripts/PackageManager.tscn")

var time = 0

var score = {
  base2=1,
  base4=0,
  base6=0,
  energy=1000,
  o2_plants=1, 
  material=200,
  population=1,
  greenhouse=1,
  solar_panels=0,
  fusion_plants=0,
  mines=0
}

@onready var DayText = $ColorRect/Day/DayText
var day = 0

@onready var FoodText = $ColorRect/Food/FoodText
var foodpercent = 100

var secsperday = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	DayText.text = str(day)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if (time>=secsperday):
		newday()
	pass

func newday():
	day += 1
	DayText.text = "Day " + str(day)
	time -= secsperday

func updateelectricity():
	score.solar_panels += 1
	print(score.solar_panels)
	
func createhistory():
	var instance = Package.instantiate()
	self.add_child(instance)
	instance.getday(day)


func _on_button_pressed():
	createhistory()
	pass # Replace with function body.
