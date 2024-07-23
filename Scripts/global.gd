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
	if score >= 500 and score <1000: #this will eventually be where the math that determines the bomb spawn goes
		bombLower = 8
		bombUpper = 10
	if score >= 1000 and score <1500: #this will eventually be where the math that determines the bomb spawn goes
		bombLower = 7
		bombUpper = 9
	if score >= 1500 and score <2000: #this will eventually be where the math that determines the bomb spawn goes
		bombLower = 5
		bombUpper = 7
	if score >= 2000 and score <2500: #this will eventually be where the math that determines the bomb spawn goes
		bombLower = 4
		bombUpper = 5
	if score >= 2500 and score <3000: #this will eventually be where the math that determines the bomb spawn goes
		bombLower = 3
		bombUpper = 4
	if score >= 3000: #this will eventually be where the math that determines the bomb spawn goes
		bombLower = 2
		bombUpper = 4
