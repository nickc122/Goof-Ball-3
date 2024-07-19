extends Area2D

var speed = 150 #sets the speed, regardless of direction
var movement = {} #sets an empty variable to be used throughout script to determine final movement based on direction
var points = 100 #how many points, taps into a global variable to keep score
@onready var screensize = get_viewport_rect().size #accesses the screensize in case it changes
var destroyMargin = 100 #easy access to change the distance outside the screen at which destroyed

func _ready(): #called after children, but no children here
	if global_position.y > screensize.y: #this statement determines if it is spawning at top or bottom and sets final movement accordingly
		movement = -speed
	else:
		movement = speed

func _physics_process(delta): #currently just moving it along and determining when to destroy
	global_position.y += movement*delta #by this point, var movement contains direction and speed
	if global_position.y > screensize.y + destroyMargin or global_position.y < -destroyMargin:
		queue_free() #destroying when far enough off screen

func hit():
	queue_free()
	Global.scoring(points) #sets score upon collision with ball

