extends Label

func _ready():
	# Получаем ссылку на родительский узел (Sprite2D)
	var parent_node = get_parent()
	
	# Проверяем, что родительский узел существует и имеет имя
	if parent_node and parent_node.name:
		# Устанавливаем текст названия родительского узла
		text = parent_node.name
