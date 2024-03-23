extends Node

var score := 0

func set_score():
	$Score.text = "Score " + str(score)	
	
func update_save_data():
	var save_data = SaveAndLoad.load_data_from_file()
	if score > save_data:
		SaveAndLoad.save_data_to_file(score)

func _on_enemy_score_up():
	score += 10
	set_score()

func _on_enemy_leave():
	score -= 5
	set_score()


func _on_player_player_death():
	update_save_data()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://game_over.tscn")

	
