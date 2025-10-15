extends Node2D

@export var speed_curve: Curve
@export var ball_curve: Curve
@export var ball_timer: Timer
@export var ball_spawner: Node

@onready var score_label: Label = get_tree().get_first_node_in_group("ScoreLabel")
@onready var game_over_label: Label = get_tree().get_first_node_in_group("GameOverLabel")
@onready var restart_button: Button = get_tree().get_first_node_in_group("RestartButton")
@onready var score_timer: Timer = get_tree().get_first_node_in_group("ScoreTimer")

var game_time := 0.0
var difficulty := 0.0
var Game: Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	game_time += delta
	difficulty = speed_curve.sample(minf(game_time / 50, 50))
	
	ball_timer.wait_time = ball_curve.sample(minf(game_time / 50, 50))


func end() -> void:
	for c in ball_spawner.get_children():
		c.queue_free()
		
	ball_timer.stop()
	score_timer.stop()
	
	
	game_over_label.show()
	restart_button.show()


func restart() -> void:
	game_time = 0.0
	difficulty = 0.0
	
	ball_timer.start()
	score_timer.start()
	
	score_label.score = 0
	score_label.text = "Score: 0"
	
	game_over_label.hide()
	restart_button.hide()
