extends CharacterBody2D

@export var move_speed : float = 20
@export var animator : AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Input.get_vector("left","right","up","down") * move_speed
	if velocity == Vector2.ZERO : 
		animator.play("Idle")
		#print("Idle")
	else :
		animator.play("Run")
		#print("Run")
	move_and_slide()
	pass
