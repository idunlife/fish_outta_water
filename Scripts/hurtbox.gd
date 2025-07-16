extends Area3D
class_name MyHurtBox

signal receved_damage(damage:int)

@export var parent : CharacterBody3D

func _init() -> void:
	collision_layer = 0
	collision_mask = 2
	
func _ready():
	connect("area_entered", _on_area_entered)

func _on_area_entered(hitbox: MyHitBox)->void:
	if hitbox !=null:
		parent.health -= hitbox.damage
		receved_damage.emit(hitbox.damage)
