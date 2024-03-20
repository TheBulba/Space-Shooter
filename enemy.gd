extends Area2D

const SPEED = 20
var ARMOR := 3

func _ready():
	pass 
	
func _process(delta):
	position.x -= SPEED * delta
	
