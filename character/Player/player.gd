extends CharacterBody3D
class_name Player

var direction := Vector3()
@export var groundcheck: Area3D
@export var gravity: float = 9.8

var max_health= 100
var health=100

var grounded := false

func _physics_process(delta):
	
	grounded = false
	for body in groundcheck.get_overlapping_bodies():
		if body.is_in_group("ground"):
			grounded = true
			break

	if not grounded:
		velocity.y -= gravity * delta
	else:
		velocity.y = 0

	move_and_slide()
	
	$CameraRig.position = lerp($CameraRig.position, position, 0.1)

func get_input_vector() -> Vector3:
	direction = Vector3.ZERO

	if Input.is_action_pressed("up"):
		direction.z -= 1
	if Input.is_action_pressed("down"):
		direction.z += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	return direction.normalized()
