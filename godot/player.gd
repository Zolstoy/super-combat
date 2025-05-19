extends RigidBody2D

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		self.apply_impulse(Vector2.UP * 250)
