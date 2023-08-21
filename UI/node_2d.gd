# Скрипт для автодобавления и автонумерации кнопок при добавлении товаров в магазин - Кнопка должнаиметиь имя Button+(порядковый номер)
extends Control

var select: int = 0
var curItem: int = 0
var buttonCounter: int = 1 # Для нумерации кнопок
var child_buttons = [] # Массив для хранения дочерних кнопок

func _ready():
	for child in $Panel/ShopButton/ScrollContainer/VBoxContainer.get_children():
		if child is Button:
			var button_name = "Button" + str(buttonCounter)
			child.name = button_name 
			buttonCounter += 1 
			child.connect("ololo",_on_button_pressed)
			child_buttons.append(child)
		else: pass
	
func _on_button_pressed(sender_path):
	var sender_name = self.get_node(sender_path).name
	if sender_name.length() > 0:
		#print(self.name + ": получен сигнал от: " + sender_name) # DEBUG
		var regex = RegEx.new()
		regex.compile("\\d+")
		var match = regex.search(sender_name)
		if match:
			var buttonNumber = match.get_string().to_int()
			select = buttonNumber - 1
	else: 
		print("Ошибка при извлечении номера кнопки")
	
	for i in range(Items.items.size()):
		if select == i:
				curItem = select
				print("Cost:", Items.items[curItem]["Cost"])
				
	
				
