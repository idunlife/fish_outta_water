extends Node3D

@export var head :Node3D
@export var player :CharacterBody3D
@onready var camera = $Camera_Target/Camera3D

const BOB_FREQ =2.0
const BOB_AMP =0.08
var t_bob = 0.0

var SENSITIVITY = 0.005

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-20), deg_to_rad(40))

func _physics_process(delta):
	t_bob += delta* player.velocity.length()
	camera.transform.origin = _headbob(t_bob)
	
func _headbob(time)-> Vector3:
	var pos = Vector3.ZERO
	pos.y  = sin(time * BOB_FREQ) * BOB_AMP
	return pos
