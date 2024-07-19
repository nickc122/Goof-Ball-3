extends Node

var score = 0 #sets the score as a global variable, begins the game at 0
var can_shoot = true #sets that the launcher can shoot a ball at the beginning

func scoring(points): #a simple scoring function set up so that targets can call...
	score += points #...using the variable points
	
