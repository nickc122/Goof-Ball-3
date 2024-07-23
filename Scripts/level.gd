extends Node2D

@onready var ui = $UI
#@onready var screensize = get_viewport_rect().size

var gameOverScene = preload("res://Scenes/game_over.tscn") #preloads the game over screen

func _process(delta): #contstantly checking for the end-game signal
	if Global.bomb_been_hit: #receives the end-game signal
		var gameOver = gameOverScene.instantiate() #calls up the game over screen
		gameOver.display_score() #updates the score text in the GO screen
		ui.add_child(gameOver) #adds it to the UI
