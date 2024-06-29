class_name TitleScreen

extends Node2D

@onready var timer_x = $TimerX
@onready var timer_y = $TimerY

var direction_x = 1;
var direction_y = 0.1;
var cycle = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var scale = sqrt(timer_x.time_left / 2)
	position.x += lerp(0, 1, scale) * direction_x * delta
	position.y += lerp(0, 1, scale) * direction_y * delta


func _on_timer_timeout():
	# increment / reset cycle
	if cycle == 1:
		cycle = 2
	elif cycle == 2:
		cycle = 1
	
	# reverse direction on timeout / cycle
	direction_y = direction_y * -1
	if cycle == 2:
		direction_x = direction_x * -1
		
