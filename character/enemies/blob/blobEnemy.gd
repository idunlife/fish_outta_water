extends CharacterBody3D
class_name blobEnemy

@export var groundcheck: Area3D
@export var gravity: float = 9.8

var grounded := false

@export var max_health= 10.0
@export var health=1.0

func _physics_process(delta):
	# Ground check: see if any overlapping body is in "ground" group
	grounded = false
	for body in groundcheck.get_overlapping_bodies():
		if body.is_in_group("ground"):
			grounded = true
			break

	# Gravity logic
	if not grounded:
		velocity.y -= gravity * delta
	else:
		velocity.y = 0
	move_and_slide()
