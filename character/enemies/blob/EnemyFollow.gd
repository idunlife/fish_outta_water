extends State
class_name EnemyFollow

@export var enemy: CharacterBody3D

@export var move_speed:= 10

@export var detect_range := 15.0
@export var attack_range:= 3.0

@export var health: ProgressBar

var player: CharacterBody3D

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length()>attack_range:
		enemy.velocity= direction.normalized() * move_speed
	else:
		enemy.velocity = Vector3()

	if direction.length()>detect_range:
		state_transitioned.emit(self, "idle")


func _on_health_dead(parent: CharacterBody3D) -> void:
	state_transitioned.emit(self, "Dead")
