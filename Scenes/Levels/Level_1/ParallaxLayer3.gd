extends ParallaxLayer


# Установка значения зеркалирования слоя
func set_layer_mirroring(mirroring: Vector2):
	set_mirroring(mirroring)

# Обработчик сигнала обновления
func _process(delta):
	# Перемещаем слой на основе фактора параллакса и позиции камеры
	set_motion_offset(get_viewport().get_camera_2d().position )



# Вызов функции set_layer_mirroring() внутри метода _ready()
func _ready():
	var screen_size = get_viewport_rect().size
	set_layer_mirroring(Vector2(0, screen_size.y/2))
