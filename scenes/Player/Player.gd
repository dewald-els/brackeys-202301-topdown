extends KinematicBody2D
class_name Player

# Signals
signal player_fired_bullet(bullet, position, direction)


# Preloads
var bullet = preload("res://scenes/Bullet/Bullet.tscn")


# Variables
var move_speed:float = 275


# Functions
func _physics_process(_delta: float) -> void:
	var motion = Vector2()
	
	if Input.is_action_pressed("player_up"):
		motion.y -= 1
	if Input.is_action_pressed("player_down"):
		motion.y += 1
	if Input.is_action_pressed("player_left"):
		motion.x -= 1
	if Input.is_action_pressed("player_right"):
		motion.x += 1
	
	motion = motion.normalized()
	motion = move_and_slide(motion * move_speed)

	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("player_fire"):
		fire()


func fire():
	var target = get_global_mouse_position()
	var bullet_origin = $BulletOrigin.get_global_position()
	var direction_to_mouse = bullet_origin.direction_to(target).normalized()
	emit_signal("player_fired_bullet", bullet_origin, direction_to_mouse)


func kill():
	var _reload = get_tree().reload_current_scene()


# Events
func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		kill()
