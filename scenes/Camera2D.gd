extends Camera2D
class_name GameCamera

export(float) var speed = 30.0

func _physics_process(delta: float) -> void:
	var player_nodes = get_tree().get_nodes_in_group("player")
	
	if (player_nodes.size() <= 0):
		return

	var player: Player = player_nodes[0]
	var player_pos = player.get_global_position()
	global_position = lerp(player_pos, global_position, pow(2, -speed * delta))
