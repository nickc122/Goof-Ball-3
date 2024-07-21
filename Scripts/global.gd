extends Node

var score = 0 #sets the score as a global variable, begins the game at 0
var can_shoot = true #sets that the launcher can shoot a ball at the beginning
var bombLower = 8 #the lower bound for the initial bomb timer
var bombUpper = 12 #the upper bound for the initial bomb timer


func game_restart(): #resets the intial variables, probably code out later
	score = 0 #sets the score as a global variable, begins the game at 0
	can_shoot = true #sets that the launcher can shoot a ball at the beginning
	bombLower = 8 #the lower bound for the initial bomb timer
	bombUpper = 12 #the upper bound for the initial bomb timer
	get_tree().reload_current_scene() #reloads game

func scoring(points): #a simple scoring function set up so that targets can call...
	score += points #...using the variable points
	if score >= 800: #this will eventually be where the math that determines the bomb spawn goes
		bombLower = 4
		bombUpper = 5
	
