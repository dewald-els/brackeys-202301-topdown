extends Node2D
class_name GameWorld

onready var bullet_manager: BulletManager = $BulletManager
onready var player: Player = $Player

func _ready() -> void:
	var _conn = player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")
	var _enemy_killed = SignalBus.connect("on_enemy_killed", self, "handle_enemy_killed")
	
func handle_enemy_killed() -> void:
	print("Enemy was killed")
