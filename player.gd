extends CharacterBody2D

var BULLET = preload("res://bullet.tscn")

const SPEED = 100.0

func _physics_process(delta):

	#var x = Input.get_axis("ui_left", "ui_right")
	var y = Input.get_axis("ui_up", "ui_down")
	
	#velocity.x = x * SPEED
	velocity.y = y * SPEED
	
	if Input.is_action_just_pressed("ui_accept"):
		Fire_Bullet()
		
	move_and_slide()

func Fire_Bullet():
	var bullet = BULLET.instantiate()
	var main = get_tree().current_scene
	main.add_child(bullet)
	bullet.global_position = global_position
