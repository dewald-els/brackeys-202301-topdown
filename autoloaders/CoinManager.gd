extends Node

var total_coins = 0
var collected_coins = 0
var remaining_coins = 0

func _ready() -> void:
	var coins = get_tree().get_nodes_in_group("coin")
	total_coins = coins.size()
	remaining_coins = total_coins

func handle_coin_collected() -> void:
	print("Coin collected")
