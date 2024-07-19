extends Control

@onready var score = $Score #calls the score child to prepare to change it

func _process(delta): #Just constantly updates the score, maybe a better way to do it
	score.text = "Score: " + str(Global.score) #calls the score child via variable, specifically text
