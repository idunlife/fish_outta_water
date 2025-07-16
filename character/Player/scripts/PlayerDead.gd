extends State
class_name DeadState

@export var player: CharacterBody3D

func Enter():
	player.queue_free()
