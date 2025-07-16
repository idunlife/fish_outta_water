extends State
class_name EnemyIdle

@export var enemy: CharacterBody3D

@export var move_speed:=3.0

@export var detect_range :=10

@export var health: ProgressBar

var player: CharacterBody3D

var move_direction : Vector3
var wander_time : float

func _ready():
	health.dead.connect(_on_health_dead)

func randomized_wander():
	move_direction = Vector3(randf_range(-1, 1), 0, randf_range(-1, 1)).normalized()
	wander_time = randf_range(3, 5)
	
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomized_wander()

func Update(delta:float):
	if wander_time>0:
		wander_time -=delta
	else:
		randomized_wander()

func Physics_Update(delta:float):
	if enemy:
		enemy.velocity = move_direction* move_speed
	
	var direction = player.global_position- enemy.global_position
	
	if direction.length()<detect_range:
		state_transitioned.emit(self, "Follow")

func _on_health_dead(parent: CharacterBody3D) -> void:
	state_transitioned.emit(self, "Dead")
