extends Node

var main


func _ready():
	main = get_parent()


func _on_pressed():
	# TODO: for now just loop the first level.
	main.current_level_index = 0
	main.load_next_level()
