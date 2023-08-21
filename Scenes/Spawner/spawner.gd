extends Node2D

@export_category("Сцены анимации рыб")
@export var spawn_object: Array[PackedScene]
@export_category("Количество копий")
@export var spawn_number: Array[int] = [1] # по умолчанию 1
@export_category("Позиция спавна")
@export var spawn_position: Array[Vector2]
@export var size = 1000

var random = RandomNumberGenerator.new()
var speeds = [] # массив для хранения случайных скоростей
var move_speed: float = 0.0
var enemy_tag: String = "Fish"

func _ready():
	spawn()
	var screen_size = get_viewport_rect().size
	var spawn_position = Vector2(screen_size.x / 2, global_position.y) # Позиция появления игрока равная половине экрана только по оси X
	global_position = spawn_position

func getRandomPosition(size):
	random.randomize()
	var x = random.randf_range(-abs(size), abs(size))
	var y = random.randf_range(-abs(size*2), abs(size*9))
	return Vector2(x, y)

func spawn():
	if spawn_object.size() == 0:
		return

	for i in range(spawn_object.size()):
		var scene_index = i
		var selected_scene = spawn_object[scene_index]
		var copies = spawn_number[i]
		var position = spawn_position[i]*100
		var origin_position = position

		for j in range(copies):
			var obj = selected_scene.instantiate()
			var spawnPosition = origin_position + getRandomPosition(size)
			obj.position = spawnPosition
			if obj.has_method("set_move_speed"): # цепляем СКорость из скрипта fish
				obj.move_speed = move_speed
		# Установка enemy_tag для каждой копии
			if obj.has_method("set_enemy_tag"):
				obj.set_enemy_tag("Fish")
			add_child(obj)
			randspeed() # Генерация случайной скорости для каждой рыбы

func randspeed(): # задаём случайную скорость для каждой рыбы (копии)
	var fish_speed = random.randf_range(100, 300)
	speeds.append(fish_speed)


