extends Node2D

@export var arena_part_scene: PackedScene

func _ready():
	var viewport_width = self.get_viewport_rect().size.x
	var viewport_height = self.get_viewport_rect().size.y
	
	var ceiling = arena_part_scene.instantiate() as Node2D
	var collider = ceiling.get_child(0) as CollisionShape2D
	var shape = collider.shape as RectangleShape2D
	shape.size.x = viewport_width
	ceiling.position.x = viewport_width / 2
	ceiling.position.y = shape.size.y / 2
	
	var floor = ceiling.duplicate()
	floor.position.y = viewport_height - shape.size.y / 2
	
	var wall_left = arena_part_scene.instantiate() as Node2D
	collider = wall_left.get_child(0) as CollisionShape2D
	shape = collider.shape as RectangleShape2D
	shape.size.y = viewport_height
	wall_left.position.x = shape.size.x / 2
	wall_left.position.y = viewport_height / 2
	
	var wall_right = wall_left.duplicate()
	wall_right.position.x = viewport_width - shape.size.x / 2
	wall_right.position.y = viewport_height / 2
	
	add_child(ceiling)
	add_child(floor)
	add_child(wall_left)
	add_child(wall_right)
	
	
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit() # default behavior

func _process(_delta: float) -> void:
	if Input.is_action_just_released("quit"):
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
