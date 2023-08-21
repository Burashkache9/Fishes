extends ParallaxLayer

@onready var left_sprite = $left
@onready var right_sprite = $right


func _ready():
	# Получить размер экрана
	var screen_size = get_viewport_rect().size
	
	# Получить размер спрайта
	var left_sprite_size = left_sprite.texture.get_size()/2
	var right_sprite_size = right_sprite.texture.get_size()/2
	# Установить позицию спрайта в правой части экрана
	right_sprite.position.x = screen_size.x - right_sprite_size.x
	# Установить позицию спрайта в левой части экрана
	left_sprite.position.x = screen_size.x - screen_size.x + left_sprite_size.x

func _on_window_resized():
	# При изменении размера окна пересчитать позицию спрайта
	var screen_size = get_viewport_rect().size
	
	var right_sprite_size = right_sprite.texture.get_size()
	var left_sprite_size = left_sprite.texture.get_size()
	
	right_sprite.position.x = screen_size.x - right_sprite_size.x
	left_sprite.position.x = screen_size.x - screen_size.x + left_sprite_size.x
