extends Node2D
class_name BulletManager

var bullet = preload("res://scenes/Bullet/Bullet.tscn")

func handle_bullet_spawned(position, direction) -> void:
	var bullet_instance: Bullet = bullet.instance()
	add_child(bullet_instance)
	bullet_instance.global_position = position
	bullet_instance.set_direction(direction)
