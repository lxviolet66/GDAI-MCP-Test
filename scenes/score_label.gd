extends Label


@export var score_timer: Timer

var score := 0


func _on_score_timer_timeout() -> void:
	score += 1
	self.text = str("Score: %s" % score)
