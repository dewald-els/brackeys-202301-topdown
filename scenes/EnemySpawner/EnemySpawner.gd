extends Node2D
class_name EnemySpawner

enum EnemyType {
	NORMAL,
	LARGE
}

var _enemy = preload("res://scenes/Enemy/Enemy.tscn")

@export var enemy_type: EnemyType = EnemyType.NORMAL

func _ready():
	var enemy_instance = _enemy.instantiate();
	enemy_instance.global_position = global_position
	enemy_instance.set_type(enemy_type)
	print("Adding enemy", position, global_position)
	add_child(enemy_instance)
