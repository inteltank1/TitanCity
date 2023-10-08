extends Control
@onready var Package = load("res://Scripts/PackageManager.tscn")

#Resources needed for the construction of the elements

@onready var DayText = $ColorRect/Day/DayText


@onready var FoodText = $ColorRect/Food/FoodText
var foodpercent = 100
var time = 0
var day = 0
var electricityused = 0
var electricitylimit = 0
var foodadd = 0
var maxpeople = 0
var population = 1
var resources = 0
var resourceadd = 0 

var secsperday = 15

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
	resources += resourceadd
	foodpercent -= population*2
	foodpercent += foodadd
	day += 1
	time -= secsperday
	updatelabels()

func createhistory():
	var instance = Package.instantiate()
	self.add_child(instance)
	instance.getday(day)


func _on_button_pressed():
	createhistory()
	pass # Replace with function body.


func moreelectricity(electricitygained):
	electricitylimit += electricitygained
	updatelabels()

func remove_electricity(electricityused5):
	electricityused += electricityused5
	updatelabels()
	
func foodmaker(food):
	foodadd += food
	updatelabels()
	
func houselimitadd(peopleadd):
	maxpeople += peopleadd
	updatelabels()
	
func peoplearriving(people):
	population += people
	updatelabels()
	
func useresources(howmuch):
	resources -= resources
	
func getresources(howmuch):
	resourceadd += howmuch
	
func updatelabels():
	$ColorRect/Inhabitants/InhabitantsText.text = str(population)+"/"+str(maxpeople)
	$ColorRect/Resources/ResourcesText.text = str(resources)
	$ColorRect/Food/FoodText.text = str(foodpercent)
	$ColorRect/Electricity/ElectricityText.text = str(electricityused)+"/"+str(electricitylimit)
	DayText.text = "Day " + str(day)

var Resources_for_construction = {
	base2=25,
	base4=50,
	base6=75,
	Windmill=50,
	rocket=100,
	Greenhouse=300,
	SolarPanels=10,
	fusion_plants=1000,
	o2_plants=300,    # generates o2 for 100 persons/day.
	Cave=200,
	Factory=250
}

func canplace(name):
	if resources >= Resources_for_construction[name]:
		resources -= Resources_for_construction[name]
		return true
	else:
		return false

func resourcesneeded(name):
	$ResourcesNeededText.text = "Resources needed: "+str(Resources_for_construction[name])



func _on_speedx_1_pressed():
	secsperday = 15
	pass # Replace with function body.


func _on_speedx_2_pressed():
	secsperday = 7.5
	pass # Replace with function body.


func _on_speedx_3_pressed():
	secsperday = 2.5
	pass # Replace with function body.
