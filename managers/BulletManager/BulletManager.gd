extends Node2D
class_name BulletManager

@export var bullet: PackedScene

func handle_bullet_spawned(new_position: Vector2, new_direction: Vector2) -> void:
	var bullet_instance: Bullet = bullet.instantiate()
	add_child(bullet_instance)
	bullet_instance.global_position = new_position
	bullet_instance.set_direction(new_direction)
