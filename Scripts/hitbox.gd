extends Area3D
class_name MyHitBox

@export var parent : CharacterBody3D
@export var damage :int =1 :set = set_damage, get = get_damage

func _init() -> void:
	collision_layer = 2
	collision_mask = 0

func set_damage(value: int) -> void:
	damage = value

func get_damage() -> int:
	return damage
