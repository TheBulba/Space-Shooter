extends Node

var score = 0

func set_score():
	$Score.text = "Score = " + str(score)	

func _on_enemy_score_up():
	score += 10
	set_score()
