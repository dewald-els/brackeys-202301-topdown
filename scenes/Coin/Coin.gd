extends Node2D
class_name Coin


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CollectArea2D_body_entered(body):
	if "Player" in body.name:
		SignalBus.emit_signal("on_coin_collected")
		queue_free()
