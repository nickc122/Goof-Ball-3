extends CharacterBody2D


var speed = 200
var shoot_speed = 1
var ballInstance = preload("res://Scenes/ball.tscn")
#var can_shoot = true

@onready var screensize = get_viewport_rect().size
@onready var ballContainer = $BallContainer
@onready var spriteHeight = ($Sprite2D.texture.get_height()) #0

func _physics_process(delta):
	velocity = Vector2(0,0)						#resets speed to 0 if no button pushed
	
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	move_and_slide()							#required to actually trigger movement


	if global_position.y < (0 - spriteHeight):
		global_position.y = (screensize.y + spriteHeight)
	if global_position.y > (screensize.y + spriteHeight):
		global_position.y = (0 - spriteHeight)
		
func _process(delta):
	if Input.is_action_just_pressed("shoot_ball"):
		shoot()
		
func shoot():
	if Global.can_shoot:
		var launchedBall = ballInstance.instantiate()
		ballContainer.add_child(launchedBall)
		launchedBall.global_position = global_position
		launchedBall.global_position += Vector2(5,33)
		Global.can_shoot = false
		await get_tree().create_timer(1).timeout
		if is_instance_valid(launchedBall):
			Global.can_shoot = true
			print("Timeout")
