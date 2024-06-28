extends Node

@onready var game_manager = %GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	print(game_manager)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	game_manager.load_level_1()
