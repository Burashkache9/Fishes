## fish1.gd
extends CharacterBody2D

## На сколько увеличится вес на крючке при поимке этой рыбины
@export var fish_weight_for_amount = 1## На сколько увеличится вес на крючке при поимке этой рыбины


@export var enemy_tag = "Fish"
@onready var fish = self
@export var move_speed: float = 0.0
@export var MIN = Vector2(-400, -100)
@export var MAX = Vector2(400, 100)
@export var MIN_FISH_SPEED = 50
@export var MAX_FISH_SPEED = 250
var xx = randf_range(MIN.x, MAX.x)
var yy = randf_range(MIN.y, MAX.y)
@onready var destination_position = Vector2(xx, yy)
var start_position: Vector2

func _ready():
	set_move_speed()
	
	start_position = fish.position

func go_there(delta):
	fish.position = fish.position.move_toward(destination_position, delta * move_speed)
	if fish.position.distance_to(destination_position) < 1.0:
		var temp = start_position
		start_position = destination_position
		destination_position = temp
	var scale_coef = 0.5
	if destination_position.x < start_position.x:
		fish.scale.x = -scale_coef
		fish.scale.y = scale_coef
	else:
		fish.scale.x = scale_coef
		fish.scale.y = scale_coef

func set_move_speed():
	move_speed = randf_range(MIN_FISH_SPEED, MAX_FISH_SPEED)

func _process(delta):
	go_there(delta)

func _on_area_2d_body_entered(body):
	if body.get("player_tag") == "Player":
		UserInterface.fishs_amount += fish_weight_for_amount
		queue_free()
