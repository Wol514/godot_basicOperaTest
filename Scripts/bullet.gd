extends Area2D

@export var bullet_speed :float = 150

func _ready() -> void:
	# 3s后子弹自动消失
	await get_tree().create_timer(3).timeout
	queue_free()

func _process(delta: float) -> void:
	position += Vector2(bullet_speed,0)*delta
