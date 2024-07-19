extends Area2D

var speed = 500
@onready var screensize = get_viewport_rect().size 

func _physics_process(delta): #happens every time physics are processed, related to time, not FPS
	global_position.x += speed*delta #sets the ball moving forward each time
	if global_position.x > screensize.x + 50: #destroys after it leaves the screen
		queue_free()


func _on_area_entered(area): #the area that entered the ball's area, a target
	queue_free() #destroys the ball
	area.hit() #calls the target area's hit function
	Global.can_shoot = true #reactivates the blaster
	
	
