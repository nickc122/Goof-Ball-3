extends Control

@onready var score = $Score

func _process(delta): #Just constantly updates the score
	score.text = "Score: " + str(Global.score)
