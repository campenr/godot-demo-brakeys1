extends Node2D


const SPEED = 60;

var direction = 1

@onready var ray_right = $RayRight
@onready var ray_left = $RayLeft

@onready var animated_sprite = $AnimatedSprite2D


func _process(delta):
	if ray_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	elif ray_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false

	position.x += SPEED * delta * direction
