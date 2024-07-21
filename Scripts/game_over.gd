extends Control

func display_score():
	$Panel/FinalScore.text = "Final Score: " +str(Global.score)

func _on_retry_pressed():
	Global.game_restart()
