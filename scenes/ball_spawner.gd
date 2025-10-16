extends Node


@export var ball_scene: PackedScene
@export var material: ShaderMaterial


func _on_ball_timer_timeout() -> void:
	var viewport_size: Vector2 = get_viewport().get_visible_rect().size

	var ball: Node2D = ball_scene.instantiate()
	add_child(ball)
	
	ball.difficulty_snapshot = get_parent().difficulty
	
	var swap_side := bool(randi_range(0, 1))
	
	if swap_side:
		ball.position.x = (ball.scale.x / 2) * -1
		ball.direction = "right"
	else:
		ball.position.x = viewport_size.x + ball.scale.x / 2
		ball.direction = "left"
	ball.position.y = randi_range(0, int(viewport_size.y))
	
	var scale_factor := randf_range(0.75, 1.25)
	ball.scale *= Vector2(scale_factor, scale_factor)
	
	ball.get_child(0).get_child(0).material = material.duplicate()
	ball.get_child(0).get_child(0).material.set("shader_parameter/Shift_Hue", randf_range(0,1))
