extends Control

@export var labelFontSize: int = 20
var offset = 20

#@export var label1Position: Vector2 = Vector2(100, 100)
@export var label2Position: Vector2 = Vector2(200, 200)
var fish_amount_now
var label1
var label2
var label3
var label4
var label5
var label6

func _ready():
	var screen_size = get_viewport_rect().size
	label1 = $Label_player_experience 
	label2 = $Label_player_level      
	label3 = $Label_player_money
	label4 = $Label_player_zakidkaY
	label5 = $Label_player_current_weight # Текущий вес рыбы
	label6 = $Label_player_max_weight     # Максимальный вес рыбы
	
	if label1:
		label1.text = "Опыт: " + str(LS.player_experience)
		label1.add_theme_font_size_override("font_size", labelFontSize)
		label1.position = Vector2(screen_size.x - screen_size.x + offset , screen_size.y - screen_size.y + offset)
	if label2:
		label2.text = "Уровень: " + str(LS.player_level)
		label2.add_theme_font_size_override("font_size", labelFontSize)
		label2.position = Vector2(screen_size.x - (label2.size.x) - offset , screen_size.y - screen_size.y + offset)
	if label3:
		label3.text = "Деньги: " + str(LS.player_money)
		label3.add_theme_font_size_override("font_size", labelFontSize)
		label3.position = Vector2(screen_size.x - label3.size.x - offset , screen_size.y - screen_size.y + offset + label2.size.y)
	if label4:
		label4.text = "Леска: " + str(LS.player_zakidkaY)
		label4.add_theme_font_size_override("font_size", labelFontSize)
		label4.position = Vector2(screen_size.x - label4.size.x - offset , screen_size.y - screen_size.y + offset + label3.size.y + label2.size.y)
	if label5:
		label5.text = "Вес: " + str(UserInterface.fishs_amount) + "/" +  str(LS.player_max_weight)
		label5.add_theme_font_size_override("font_size", labelFontSize)
		label5.position = Vector2(screen_size.x - label5.size.x - offset , screen_size.y - screen_size.y + offset + label4.size.y + label3.size.y + label2.size.y)

func _process(delta):
	label5.text = "Вес: " + str(UserInterface.fishs_amount) + "/" +  str(LS.player_max_weight)
	if UserInterface.fishs_amount >= LS.player_max_weight:
		label5.add_theme_color_override("font_color", Color.RED)
