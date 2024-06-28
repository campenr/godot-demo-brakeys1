extends Node

signal score_changed

var score = 0

func _ready():
	get_tree().change_scene_to_file('./scenes/title.tscn')
	#load_level_1()

func scored():
	score += 1
	score_changed.emit(score)

func load_level_1():
	get_tree().change_scene_to_file('./scenes/level_0.tscn')
