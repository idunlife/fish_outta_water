extends Node
class_name StateInputWatcher

@export var player: CharacterBody3D
@export var state_manager: Node

signal request_state_change(state_name: String)

func _process(_delta: float):
	if Input.is_action_pressed("dash"):
		request_state_change.emit("dash")
		return

	var dir = player.get_input_vector()

	if dir == Vector3.ZERO:
		request_state_change.emit("idle")
	else:
		request_state_change.emit("move")
		
	if player.health == 0:
		request_state_change.emit("dead")
