extends Area2D
class_name Bullet


export (int) var speed = 1000


var direction := Vector2.ZERO


func _physics_process(delta: float) -> void:
	if (direction != Vector2.ZERO):
		var velocity = direction * speed * delta
		global_position += velocity
	

func set_direction(new_direction: Vector2) -> void:
	self.direction = new_direction


func _on_KillTimer_timeout() -> void:
	queue_free()


func _on_Bullet_area_entered(area: Area2D) -> void:
	if !area.is_in_group("player_area") and !area.is_in_group("detection_area"):
		queue_free()


func _on_Bullet_body_entered(body: Node2D):
	if body is TileMap:
		queue_free()
