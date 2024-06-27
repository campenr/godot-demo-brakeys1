extends Node

signal score_changed

var score = 0


func scored():
	score += 1
	print("score is now ", score)
	score_changed.emit(score)
