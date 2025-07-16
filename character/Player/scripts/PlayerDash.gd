extends State
class_name PlayerDash

@export var player: CharacterBody3D
@export var Camera_target: Node3D
@export var dash_speed: float = 100.0
@export var dash_duration: float = 0.2

var dash_timer: float = 0.0
var dash_direction: Vector3 = Vector3.ZERO

func Enter():
	dash_timer = dash_duration

func Physics_Update(delta: float):
	var dash_vector =Vector3( Camera_target.transform.basis.z.x * dash_speed, player.velocity.y, Camera_target.transform.basis.z.z * dash_speed)
	player.velocity = -dash_vector
	
	dash_timer -= delta
	if dash_timer <= 0:
		player.velocity = Vector3.ZERO
		state_transitioned.emit(self, "idle")
