extends CharacterBody2D
class_name Enemy

enum EnemyType {
	NORMAL,
	LARGE
}


@export var enemy_type: EnemyType = EnemyType.NORMAL

@onready var health_bar = $Health


var enemy_death = preload("res://scenes/Enemy/EnemyDeath.tscn") 

@export var speed: float

var motion = Vector2()
var is_active: bool = false
var health: float = 1.0
var total_health: float = 1.0


func _ready():
	pass
	# match (enemy_type):
	# 	EnemyType.NORMAL:
	# 		scale = Vector2(1, 1)
	# 		health = 1.0
	# 		speed = 4.5
	# 	EnemyType.LARGE:
	# 		scale = Vector2(1.75, 1.75)
	# 		health = 3.0
	# 		total_health = 3.0
	# 		speed = 2.5
	# 	_: 
	# 		scale = Vector2(1, 1)
	# 		health = 1.0
	# 		speed = 2.5

func _physics_process(_delta: float) -> void:
	if !is_active:
		return
	
	var player = get_parent().get_node("Player")

	position = position.move_toward(player.position, speed)
	look_at(player.position)
	set_velocity(motion)
	move_and_slide()
	motion = velocity


func set_type(_enemy_type) -> void:
	self.enemy_type = _enemy_type

func _on_Area2D_area_entered(area):
	if area.is_in_group("bullet"):
		health -= 1
		
		var percentage = health / total_health
		var current_health_bar_scale = health_bar.scale
		health_bar.scale = Vector2(percentage, current_health_bar_scale.y)
		
		print(percentage, scale.y)
		
		if (health == 0):
			SignalBus.emit_signal("on_enemy_killed")
			var enemy_death_instance = enemy_death.instantiate()
			enemy_death_instance.global_position = global_position
			var game_world = get_node("/root/GameWorld")
			game_world.add_child(enemy_death_instance)
			queue_free()


func _on_PlayerDetector_body_entered(body):
	if body is Player:
		is_active = true
