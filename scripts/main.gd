extends Node2D

signal score_changed

var score = 0
var level_score = 0

var current_level
var current_level_index: int = 0

@onready var hud = $hud


func _ready():
	# load title screen on game start
	_load_level()


func _load_level():
	var level_path = "res://scenes/levels/level_" + str(current_level_index) + ".tscn"
	current_level = load(level_path).instantiate()
	add_child(current_level)


func load_next_level():
	# increment then load level
	current_level.queue_free()
	current_level_index += 1
	_load_level()
	
	# reset ui
	hud.show()


func load_level_complete():
	# reset ui
	hud.hide()

	# switch levels out
	current_level.queue_free()
	var level_path = "res://scenes/levels/level_complete.tscn"
	current_level = load(level_path).instantiate()
	add_child(current_level)
	
	# upodate scores
	score += level_score
	level_score = 0
	score_changed.emit(level_score)


func scored():
	level_score += 1
	score_changed.emit(level_score)
