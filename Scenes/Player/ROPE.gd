extends Line2D

# Путь к ноду персонажа
@export var character_path: NodePath
@export var sprite_path: NodePath
# Амплитуда кривой Безье
@export var curve_amplitude: float = 500.0

var character_node
var sprite_node

func _ready():
	# Получаем ссылку на нод персонажа
	character_node = get_node(character_path)
	sprite_node = get_node(sprite_path)

func _process(delta):
	# Получаем размер экрана
	var screen_size = get_viewport_rect().size
	# Получаем начальную и конечную точки
	var start_point = Vector2(0,-2500)
	var end_point = sprite_node.position
	
	# Вычисляем промежуточную точку на интервале
	var point1 = lerp(start_point, end_point, 0.5)
	var point2 = lerp(start_point, end_point, 0.7)
	
	# Вычисляем контрольные точки для кривой Безье
	var control_point1 = point1 + Vector2(0, curve_amplitude)
	var control_point2 = point2 + Vector2(0, curve_amplitude)
	
	# Очищаем точки линии
	clear_points()
	
	# Добавляем начальную точку
	add_point(start_point)
	
	# Добавляем точки для кривой Безье
	var SEGMENT_COUNT = 100  # Количество сегментов кривой Безье
	
	for i in range(1, SEGMENT_COUNT + 1):
		var t = i / float(SEGMENT_COUNT)
		var pixel = calculate_cubic_bezier_point(t, start_point, control_point1, control_point2, end_point)
		add_point(pixel)
	
	# Добавляем конечную точку
	add_point(end_point)
	
	# Установка свойств линии
	set_default_color(Color(1, 1, 1))
	set_width(5)

func calculate_cubic_bezier_point(t, p0, p1, p2, p3):
	var u = 1 - t
	var tt = t * t
	var uu = u * u
	var uuu = uu * u
	var ttt = tt * t
	var p = uuu * p0 + 3 * uu * t * p1 + 3 * u * tt * p2 + ttt * p3
	return p
