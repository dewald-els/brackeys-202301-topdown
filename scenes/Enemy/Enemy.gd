extends KinematicBody2D
class_name Enemy

enum EnemyType {
	NORMAL,
	LARGE
}


export (EnemyType)var enemy_type = EnemyType.NORMAL


var motion = Vector2()
var is_active: bool = false
var health: int = 1


func _ready():
	match (enemy_type):
		EnemyType.NORMAL:
			scale = Vector2(1, 1)
			health = 1
		EnemyType.LARGE:
			scale = Vector2(1.75, 1.75)
			health = 3
		_: 
			scale = Vector2(1, 1)
			health = 1

func _physics_process(_delta):
	if !is_active:
		return
	
	var player = get_parent().get_node("Player")

	position += (player.position - position) / 50
	look_at(player.position)
	
	motion = move_and_slide(motion)


func _on_Area2D_area_entered(area):
	if area.is_in_group("bullet"):
		health -= 1
		if (health == 0):
			SignalBus.emit_signal("on_enemy_killed")
			queue_free()


func _on_PlayerDetector_body_entered(body):
	if body is Player:
		is_active = true
