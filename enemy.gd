extends Area2D

signal score_up
signal score_down

const EXPLODE = preload("res://explosion_effect.tscn")
const HIT_EFFECT = preload("res://hit_effect.tscn")
var SPEED = 40

var armor := 3

func _ready():
	var main = get_tree().current_scene
	if main.is_in_group("World"): 
		score_up.connect(main._on_enemy_score_up)
		score_down.connect(main._on_enemy_leave)
		
func _process(delta):
	position.x -= SPEED * delta
	
func _on_body_entered(body):
	body.queue_free()
	queue_free()
	

func _on_area_entered(area):
	armor -= 1
	hit_effect()
	if armor <= 0:
		area.queue_free()
		queue_free()
		Explosion()
		score_up.emit()
	else:
		area.queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	score_down.emit()

func Explosion():
	var main = get_tree().current_scene
	var explosion = EXPLODE.instantiate()
	main.add_child.call_deferred(explosion)
	explosion.global_position = global_position

	
func hit_effect():
	var main = get_tree().current_scene
	var hit = HIT_EFFECT.instantiate()
	main.add_child.call_deferred(hit)
	hit.global_position = position
