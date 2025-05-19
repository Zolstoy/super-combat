extends CollisionShape2D

@export var color: Color

func _draw() -> void:
	self.shape.draw(self.get_canvas_item(), self.color)
