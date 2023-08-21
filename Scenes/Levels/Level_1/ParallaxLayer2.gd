extends Node2D
@onready var glublina = $Glubina



func _ready():
	var screen_size = get_viewport_rect().size
	var left_sprite_size = Vector2(170,190)
	glublina.position.x = screen_size.x - screen_size.x + left_sprite_size.x/3
	# Вызываем сигнал при каждом повторении ParallaxLayer

func _on_window_resized():
	var screen_size = get_viewport_rect().size
	var left_sprite_size = Vector2(170,190)
	glublina.position.x = screen_size.x - screen_size.x + left_sprite_size.x/3
	



