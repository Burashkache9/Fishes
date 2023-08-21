# Global script - "level_select.gd" - short name for global calling = "LS"

extends Node
# Переход По Сценам
var current_scene = '1'
var map = "res://Scenes/map.tscn"
var menu = "res://Scenes/main_menu.tscn"
var shop = "res://Scenes/shop.tscn"

# Данные которые нужно добавить PLAYER
var player_experience = 0     #1
var player_level = 0          #2
var player_zakidkaY = 10      #3
var player_speed = 200        #4
var player_current_weight = 0 #5
var player_max_weight = 50    #6
var player_money = 301        #7

func save():
	var save_dict = {
		"player_experience": player_experience,           #1
		"player_level": player_level,                     #2
		"player_zakidkaY": player_zakidkaY,               #3
		"player_speed": player_speed,                     #4
		"player_current_weight": player_current_weight,   #5
		"player_max_weight": player_max_weight,           #6
		"player_money": player_money                      #7
	}
	return save_dict
	
func save_game():
	var save_game = FileAccess.open("user://savegame.save",FileAccess.WRITE)
	var json_string  = JSON.stringify(save(), "\t")
	save_game.store_line(json_string)
	save_game.close()
	
func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	var json_string = save_game.get_as_text()
	save_game.close()
	
	var json = JSON.parse_string(json_string)
	if json.has("player_experience"):      player_experience = json["player_experience"]         #1
	if json.has("player_level"):           player_level = json["player_level"]                   #2
	if json.has("player_zakidkaY"):        player_zakidkaY = json["player_zakidkaY"]             #3
	if json.has("player_speed"):           player_speed = json["player_speed"]                   #4
	if json.has("player_current_weight"):  player_current_weight = json["player_current_weight"] #5
	if json.has("player_max_weight"):      player_max_weight = json["player_max_weight"]         #6
	if json.has("player_money"):           player_money = json["player_money"]                   #7

		
func _ready():
	load_game()
