extends Node

func _ready():
	$Ship.position = Vector2(-20,90)

func _on_button_pressed():
	$Timer.start()
	$Button.queue_free()
	$Fly_In.play("Into")
	

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://World.tscn")

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
