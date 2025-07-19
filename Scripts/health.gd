extends ProgressBar

@export var parent:CharacterBody3D
var max_health :=0.0
var min_health := 0.0

signal dead(parent: CharacterBody3D)

func _ready():
	max_health = parent.max_health

func _process(delta):
	value= parent.health/max_health *100
	if parent.health <= 0:
		parent.health = 0
		dead.emit(parent)
		print("DEAD")
