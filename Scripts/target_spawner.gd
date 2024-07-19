extends Node2D

@onready var screensize = get_viewport_rect().size #gets game size to reference elsewhere in case I change things
@onready var yBottom = screensize.y + 50 #creates variables for the creation point just off screen
var yTop = -50

var apple = preload("res://Scenes/apple.tscn") #pulls the apple scene in to save time at spawn and makes it a variable for the below array
#var blueberries = preload("res://Scenes/blueberries.tscn")
var targetArray = [apple] #creating an array of all the targets controlled by this one. Will need something later to add different spawn odds
var leftBorder = 120 #distance to keep spawn from being too close to cannon
var rightBorder = 45


func _on_timer_timeout(): #a signal from the timer child node. Could be replaced in code?
	spawn() #calls the below function, separated for organization
		
func spawn():
	var whichTarget = targetArray.pick_random() #picks from the various objects this spawner spawns
	var newInstance = whichTarget.instantiate() #creates a variable of the new instance
	var horPos = randi_range(leftBorder, screensize.x - rightBorder) #picks a random location across the x axis
	var yArray = [yTop, yBottom] #sets up the random top or bottom picker
	var vertPos = yArray.pick_random() #picks randomly from top or bottom
	newInstance.global_position = Vector2(horPos, vertPos) #finally prepares the object just off screen
	add_child(newInstance) #adds it as a child
