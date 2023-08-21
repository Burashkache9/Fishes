extends CollisionShape2D

func _ready():
	set_shape(create_shape())

func create_shape() -> Shape2D:
	var shape = RectangleShape2D.new()
	shape.extents = Vector2(get_viewport_rect().size.x, 100) / 2
	return shape
