extends CharacterBody2D

@export var move_speed : float = 20
@export var animator : AnimatedSprite2D
var is_game_over:bool = false

@export var bullet_scene : PackedScene
@export var bullet_offset : Vector2

func _process(delta: float) -> void:
	velocity = Input.get_vector("left","right","up","down") * move_speed
	if not is_game_over:
		if velocity == Vector2.ZERO : 
			animator.play("Idle")
			$RunningSound.stop()
			#print("Idle")
		else :
			animator.play("Run")
			$RunningSound.play()
			#print("Run")
		move_and_slide()
	else :
		animator.play("Over")
	pass

func game_over():
	is_game_over = true
	get_tree().current_scene._over()
	$GameOver.play()
	await get_tree().create_timer(2).timeout
	print("game_over")
	get_tree().reload_current_scene()
	
	pass # Replace with function body.

func on_fire() -> void:
	if velocity != Vector2.ZERO or is_game_over:
		return
	$FiireSound.play()
		
	var bullet_node = bullet_scene.instantiate()
	bullet_node.position = position+bullet_offset
	get_tree().current_scene.add_child(bullet_node)
