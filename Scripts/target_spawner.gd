extends Node2D

func _ready():
	points_target_timer() #starts the timer from standard targets from the beginning
	bomb_timer() #starts the bomb timer

@onready var screensize = get_viewport_rect().size #gets game size to reference elsewhere in case I change things
@onready var yBottom = screensize.y + 50 #creates variables for the creation point just off screen
var yTop = -50

var apple = preload("res://Scenes/apple.tscn") #pulls the apple scene in to save time at spawn and makes it a variable for the below array
var bomb = preload("res://Scenes/bomb.tscn") #loads the bomb
#var blueberries = preload("res://Scenes/blueberries.tscn")
var targetArray = [apple] #creating an array of all the targets controlled by this one. Will need something later to add different spawn odds
var leftBorder = 120 #distance to keep spawn from being too close to cannon
var rightBorder = 45



func points_target_timer(): #starts a timer to prepare to spawn something worth points
	var pointsTimer = randf_range(0.5,2.5) #randomly choose a decimal number between these two
	await get_tree().create_timer(pointsTimer).timeout #runs the time with the above number
	points_spawn() #calls the spawn function, which then calls this one back

func points_spawn():
	var whichTarget = targetArray.pick_random() #picks from the various objects this spawner spawns
	var newInstance = whichTarget.instantiate() #creates a variable of the new instance
	var horPos = randi_range(leftBorder, screensize.x - rightBorder) #picks a random location across the x axis
	var yArray = [yTop, yBottom] #sets up the random top or bottom picker
	var vertPos = yArray.pick_random() #picks randomly from top or bottom
	newInstance.global_position = Vector2(horPos, vertPos) #finally prepares the object just off screen
	add_child(newInstance) #adds it as a child
	points_target_timer() #restarts the time for the next one



func bomb_timer():
	var bombTimer = randf_range(Global.bombLower,Global.bombUpper) #the intial time to wait to call a bomb
	await get_tree().create_timer(bombTimer).timeout #calls a timer using the above variable
	bomb_spawn() #calls the bomb spawner below
	
func bomb_spawn():
	var newBomb = bomb.instantiate() #creates a new bomb
	var horPos = randi_range(leftBorder, screensize.x - rightBorder) #picks a random location across the x axis
	var yArray = [yTop, yBottom] #sets up the random top or bottom picker
	var vertPos = yArray.pick_random() #picks randomly from top or bottom
	newBomb.global_position = Vector2(horPos, vertPos) #finally prepares the object just off screen
	add_child(newBomb) #adds it as a child
	bomb_timer() #restarts the bomb timer
