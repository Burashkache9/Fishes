extends Node2D

func _ready():
	var screen_size = get_viewport_rect().size
	var left_offset = 25
	position.x = left_offset
	position.y = screen_size.y / 2  # Позиционируем посередине по оси Y

