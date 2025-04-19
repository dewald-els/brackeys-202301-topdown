extends Node2D
class_name GameWorld

@onready var bullet_manager: BulletManager = $BulletManager
@onready var player: Player = $Player

func _ready() -> void:
	var _conn = player.connect("player_fired_bullet", Callable(bullet_manager, "handle_bullet_spawned"))
	var _enemy_killed = SignalBus.connect("on_enemy_killed", Callable(self, "handle_enemy_killed"))
	var _coin_collected = SignalBus.connect("on_coin_collected", Callable(CoinManager, "handle_coin_collected"))
	
func handle_enemy_killed() -> void:
	print("Enemy was killed")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("toggle_fullscreen"):
		get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (!((get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN) or (get_window().mode == Window.MODE_FULLSCREEN))) else Window.MODE_WINDOWED
