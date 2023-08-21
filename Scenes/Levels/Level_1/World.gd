extends Node2D
# Скрипт для перехода с уровня на уровень со свецэффектами

signal world_changed(world_name)
var entered = false
@export var world_name: String = "World"

func _on_area_2d_body_entered(body):
	entered = true

func _process(delta):
	if entered == true:
		print("entered")
		emit_signal("world_changed", world_name)
func _on_area_2d_body_exited(body):
	entered = false
