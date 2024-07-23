extends Node

var score = 0 #sets the score as a global variable, begins the game at 0
var can_shoot = true #sets that the launcher can shoot a ball at the beginning
var bombLower = 8 #the lower bound for the initial bomb timer
var bombUpper = 12 #the upper bound for the initial bomb timer
var bomb_been_hit = false #the janky recipient of the end-game signal, says the game isn't over


	
func game_restart(): #resets the intial variables, probably code out later
	score = 0 #sets the score as a global variable, begins the game at 0
	can_shoot = true #sets that the launcher can shoot a ball at the beginning
	bombLower = 8 #the lower bound for the initial bomb timer
	bombUpper = 12 #the upper bound for the initial bomb timer
	bomb_been_hit = false #the game isn't over
	
func scoring(points): #a simple scoring function set up so that targets can call...
	score += points #...using the variable points
	if score >= 500 and score <1000: #the spawn rate of the bomb decreases with the score
		bombLower = 8
		bombUpper = 10
	if score >= 1000 and score <1500:
		bombLower = 7
		bombUpper = 9
	if score >= 1500 and score <2000:
		bombLower = 5
		bombUpper = 7
	if score >= 2000 and score <2500:
		bombLower = 4
		bombUpper = 5
	if score >= 2500 and score <3000:
		bombLower = 3
		bombUpper = 4
	if score >= 3000:
		bombLower = 2
		bombUpper = 4
