extends Node

var main


func _ready():
	main = get_parent()


func _on_pressed():
	main.load_next_level()
