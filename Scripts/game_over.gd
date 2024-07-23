extends Control

func display_score(): #called from level.gd to change score text
	$Panel/FinalScore.text = "Final Score: " +str(Global.score)

func _on_retry_pressed(): #the retry button
	get_tree().reload_current_scene() #reloads game
	Global.game_restart() #resets all the variables in global
