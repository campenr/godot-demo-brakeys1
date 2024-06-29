extends Area2D


var main


func _ready():
	main = get_tree().root.get_child(0)


func _on_body_entered(body):
	main.load_level_complete()
