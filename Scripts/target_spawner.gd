extends Node2D

@onready var screensize = get_viewport_rect().size
@onready var yBottom = screensize.y + 50
var yTop = -50

var apple = preload("res://Scenes/apple.tscn")
#var blueberries = preload("res://Scenes/blueberries.tscn")
var targetArray = [apple]
var leftBorder = 120
var rightBorder = 45


func _on_timer_timeout():
	spawn()
		
func spawn():
	print(yBottom)	
	var whichTarget = targetArray.pick_random()
	var newInstance = whichTarget.instantiate()
	var horPos = randi_range(leftBorder, screensize.x - rightBorder)
	var yArray = [yTop, yBottom]
	var vertPos = yArray.pick_random()
	newInstance.global_position = Vector2(horPos, vertPos)
	add_child(newInstance)
