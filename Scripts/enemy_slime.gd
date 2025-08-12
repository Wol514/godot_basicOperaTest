extends Area2D

@export var slime_speed_x :float = -40
@export var slime_speed_y : float = 0

var is_dead : bool = false

func _process(delta: float) -> void:
	if not is_dead:
		position += Vector2(slime_speed_x,slime_speed_y)*delta
	if position.x < -267:
		queue_free() 

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and not is_dead:
		body.game_over()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		get_tree().current_scene.score += 1
		$DeathSound.play()
		$AnimatedSprite2D.play("Death")
		area.queue_free()
		is_dead = true
		await get_tree().create_timer(0.5).timeout
		queue_free()
