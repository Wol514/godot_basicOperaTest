extends Node2D

@export var slime_scene :PackedScene
@export var spawn_timer :Timer
@export var score : int
@export var score_label : Label
@export var over_label : Label

func _ready() -> void:
	over_label.visible = false

func _process(delta: float) -> void:
	spawn_timer.wait_time -=0.2*delta
	spawn_timer.wait_time = clamp(spawn_timer.wait_time,1,3)
	
	score_label.text = "Score: " + str(score)

func _spawn_slime() -> void:
	var slime_node = slime_scene.instantiate()
	slime_node.position = Vector2(260,randf_range(50,115))
	get_tree().current_scene.add_child(slime_node)

func _over():
	#print("结束游戏")
	over_label.visible = true
