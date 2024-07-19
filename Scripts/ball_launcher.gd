extends CharacterBody2D


var speed = 200
var shoot_speed = 1 #can shoot every this number of seconds
var ballInstance = preload("res://Scenes/ball.tscn") #calls the ball here to save time later and sets it as a variable

@onready var screensize = get_viewport_rect().size
@onready var ballContainer = $BallContainer #calls this extra node to eventually receive the balls as children
@onready var spriteHeight = ($Sprite2D.texture.get_height()) #gets the size of the sprite

func _physics_process(delta):
	velocity = Vector2(0,0) #resets speed to 0 if no button pushed
	
	if Input.is_action_pressed("move_down"):
		velocity.y = speed #when input pressed, move up
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed #when input pressed, move down
	move_and_slide() #required to actually trigger movement


	if global_position.y < (0 - spriteHeight): #if launcher goes a certain distance off the bottom of the screen...
		global_position.y = (screensize.y + spriteHeight) #...wrap it aound to the top
	if global_position.y > (screensize.y + spriteHeight): #if launcher goes a certain distance off the top of the screen...
		global_position.y = (0 - spriteHeight) #...wrap it around to the bottome
		
func _process(delta): #happens at a time interval in which phsyics isn't involved. Time, not FPS
	if Input.is_action_just_pressed("shoot_ball"): 
		shoot() #call shoot function when input pressed on a check
		
func shoot():
	if Global.can_shoot: #checks a variable in the autoloaded Global.gd
		var launchedBall = ballInstance.instantiate() #creates an instance of the ball from the above variable
		ballContainer.add_child(launchedBall) #creates the ball as a child
		launchedBall.global_position = global_position #sets the position relevant to the launcher itself
		launchedBall.global_position += Vector2(5,33) #moves it a bit to come out of the mouth, will need to be adjusted when the sprite changes
		Global.can_shoot = false #blocks future shots until made true by the timer below or in the ball script
		await get_tree().create_timer(1).timeout #calls a timer for the can_shoot reset
		if is_instance_valid(launchedBall): #only if needed does this script reset the timer,...
			Global.can_shoot = true #...otherwise it gets reset twice and there are too many balls
