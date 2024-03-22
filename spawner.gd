extends Node2D


const ENEMY = preload("res://enemy.tscn")

func Get_Spawn_Point():
	var points = $SpawnPoints.get_children()
	points.shuffle()
	return points[0].global_position
	
func Spawn():
	var spawn_point = Get_Spawn_Point()
	var enemy = ENEMY.instantiate()	
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = spawn_point
	
func _on_timer_timeout():
	Spawn()
