## Главный скрипт в сцене[b] Player[/b][br]В этом скрипте описано поведение игрока
extends CharacterBody2D

## Определённая метка для игрока по которой строится взаимодействие данного объекта с другими
@export var player_tag = "Player"
## Коэфициент на котороый увеличивается скорость падения [b] крючка [/b] вниз от скорости подъёма
@export var downfall_speed = 4.5


@onready var collisionShape2D = $CollisionShape2D
var zakidka: Vector2 = Vector2(0 , LS.player_zakidkaY*100 )
var speed  = LS.player_speed 
var movingDown: bool = true
var is_dragging = false
var touchPos = Vector2()
var move_position: CollisionShape2D
var touch_button: TouchScreenButton

func _input(event):
	if event is InputEventScreenDrag and InputEventScreenTouch:
		if event.is_pressed():
			is_dragging = true
		else:
			is_dragging = false
			move_position.global_position = (global_position - (get_viewport_rect().size / 2)) + event.position
	elif event is InputEventMouseMotion and InputEventMouseButton:
		if event.is_pressed():
			is_dragging = true
		else:
			is_dragging = false
			move_position.global_position = (global_position - (get_viewport_rect().size / 2)) + event.position

	if is_dragging:
		touchPos = (global_position - (get_viewport_rect().size / 2)) + event.position

func _physics_process(delta):
	if is_dragging:
		move_position.global_position = touchPos
		move_and_slide()
	else:
		is_dragging = false
	if movingDown:
		
		# Движение вниз до точки Zakidka
		velocity.y = speed* 4.5 # Используйте положительную скорость для движения вниз
		move_and_slide()

		if to_global(position).y >= to_global(zakidka).y:
			movingDown = false
		else : movingDown = true
	else:
		# Движение вверх
		velocity.y = -speed # Используйте от
		move_and_slide()
	# Проверяем направление движения по оси Y и отключаем ноду CollisionShape2D при движении вниз
	if velocity.y < 0:
		collisionShape2D.set_disabled(false)
	else:
		collisionShape2D.set_disabled(true)
func _ready():
	move_position = collisionShape2D
	# Получение размеров экрана
	var screen_size = get_viewport_rect().size
	# Позиция появления игрока равная половине экрана только по оси X
	var spawn_position = Vector2(screen_size.x / 2, global_position.y)
	global_position = spawn_position
