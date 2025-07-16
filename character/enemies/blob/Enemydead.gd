extends State
class_name EnemyDead

@export var enemy: CharacterBody3D

func Enter():
	enemy.queue_free()
