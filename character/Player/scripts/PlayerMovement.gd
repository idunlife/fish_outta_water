extends State
class_name PlayerMovement

@export var player: CharacterBody3D
@export var move_speed := 10.0
@export var head : Node3D

var direction: Vector3

func UPDATE(_delta:float):
	if Input.is_action_pressed("dash"):
		state_transitioned.emit(self, "dash")

func Physics_Update(_delta: float):
	
	#makes the fish face where player is facing
	player.rotation.y = lerp(player.rotation.y, head.rotation.y , _delta*5)
	
	var input_direction = player.get_input_vector()
	input_direction = (head.transform.basis * input_direction)
	player.velocity = input_direction * move_speed
	
	if direction == Vector3.ZERO:
		state_transitioned.emit(self, "idle")
