extends Node2D
class_name GameWorld

onready var bullet_manager: BulletManager = $BulletManager
onready var player: Player = $Player

func _ready() -> void:
	var _conn = player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")
	var _enemy_killed = SignalBus.connect("on_enemy_killed", self, "handle_enemy_killed")
	var _coin_collected = SignalBus.connect("on_coin_collected", CoinManager, "handle_coin_collected")
	
func handle_enemy_killed() -> void:
	print("Enemy was killed")


func _process(delta):
	if Input.is_action_just_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
