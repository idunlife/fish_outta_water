extends State
class_name PlayerDash

@export var player: CharacterBody3D
@export var Camera_target: Node3D
@export var dash_speed: float = 100.0
var dash_direction: Vector3 = Vector3.ZERO

func Physics_Update(delta: float):
	var dash_vector =Vector3( Camera_target.transform.basis.z.x * dash_speed, player.velocity.y, Camera_target.transform.basis.z.z * dash_speed)
	player.velocity = -dash_vector

func Exit():
	player.velocity= Vector3.ZERO
