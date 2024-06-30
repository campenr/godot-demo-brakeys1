extends Node

var main

@onready var level_score = $Scores/LevelScore
@onready var total_score = $Scores/TotalScore

var initial_level_score
var initial_score

func _ready():
	main = get_parent()
	# show initial scores
	
	initial_level_score = main.level_score
	initial_score = main.score
	
	level_score.text = str(main.level_score)
	total_score.text = str(main.score)
	
	# start timer we use to ease the score allocation
	main.score_update_timer.start()
	

func _process(delta):
	#if main.level_score != 0.0:
	_update_scores(delta)

	
func _update_scores(delta):	
	# update scores
	var time_left = main.score_update_timer.time_left / 20.0
	
	var lerped = lerp(0, 1, time_left)
	
	# add the level score to the main score over time
	main.level_score = int(initial_level_score * lerped)
	main.score = initial_score + (initial_level_score - main.level_score)

	print(str(time_left) + "::" + str(lerped) +  " :: " + str(int(main.level_score * lerped)) + "::" +  str(main.level_score) + "::" + str(main.score))

	# show updated scores
	level_score.text = str(main.level_score)
	total_score.text = str(main.score)

func _on_pressed():
	# TODO: for now just loop the first level.
	main.current_level_index = 0
	main.load_next_level()
