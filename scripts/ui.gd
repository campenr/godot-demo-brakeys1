extends CanvasLayer

@onready var score = $Score

func _on_game_manager_score_changed(value):
	score.text = str(value)
