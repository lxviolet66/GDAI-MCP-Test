extends Node2D

var Game: Node2D
var speed = 500
var direction: String


func _ready() -> void:
	Game = get_parent().get_parent()


func _process(delta) -> void:
	if direction == "right":
		self.position.x += (speed * delta) * Game.difficulty
	else:
		self.position.x -= (speed * delta) * Game.difficulty


func _on_delete_timer_timeout() -> void:
	queue_free()


func _on_area_2d_mouse_entered() -> void:
	Game.end()
