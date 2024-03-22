extends Area2D

signal score_up

const EXPLODE = preload("res://explosion_effect.tscn")
const SPEED = 20
var armor := 3

func _ready():
	var main = get_tree().current_scene
	if main.is_in_group("World"): 
		score_up.connect(main._on_enemy_score_up)
		
func _process(delta):
	position.x -= SPEED * delta
	
func _on_body_entered(body):
	body.queue_free()
	queue_free()
	

func _on_area_entered(area):
	armor -= 1
	if armor <= 0:
		area.queue_free()
		queue_free()
		score_up.emit()
	else:
		area.queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _exit_tree():
	var main = get_tree().current_scene
	var explosion = EXPLODE.instantiate()
	main.add_child.call_deferred(explosion)
	explosion.global_position = global_position
	
