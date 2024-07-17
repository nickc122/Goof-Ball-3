extends Area2D

var speed = 500
@onready var screensize = get_viewport_rect().size

func _physics_process(delta):
	global_position.x += speed*delta
	if global_position.x > screensize.x + 50:
		queue_free()


func _on_area_entered(area):							#the area that entered the ball's area
	queue_free()
	area.hit()
	print("Ball hit")
	Global.can_shoot = true
	
	
