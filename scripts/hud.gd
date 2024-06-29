extends CanvasLayer

@onready var score_label = $Score


func _on_main_score_changed(score):
	score_label.text = str(score)
