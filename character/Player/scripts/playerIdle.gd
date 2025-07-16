extends State
class_name PlayerIdle

@export var player: CharacterBody3D

func Update(_delta: float):
	if Input.is_action_pressed("dash"):
		state_transitioned.emit(self, "dash")
		
	var dir = player.get_input_vector()
	if dir != Vector3.ZERO:
		state_transitioned.emit(self, "move")
