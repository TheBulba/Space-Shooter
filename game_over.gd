extends Node

func _ready():
	var save_data = SaveAndLoad.load_data_from_file()
	$Highscore.text = "Highscore: " + str(save_data)

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://start_menu.tscn")
	elif Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
