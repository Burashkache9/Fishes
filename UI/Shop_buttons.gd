extends Button

var last_char 
var curItem = 0
var buttonNumber: int
var select

signal ololo

func _ready():
	
	var regex = RegEx.new()
	regex.compile("\\d+")                          # Регулярное выражение для поиска чисел
	var match = regex.search(self.name)            # Ищем совпадения с регулярным выражением
	if match:
		text = match.get_string()	               # Устанавливаем текст кнопки = последниму символу названия кнопки
		buttonNumber = match.get_string().to_int()
		select = buttonNumber -1
		for i in range(Items.items.size()):
			if select == i:
				curItem = select
				print("Загружено " + Items.items[curItem]["Name"] + " - Cost: " + str(Items.items[curItem]["Cost"])) # DEBUG
	else: print("В названии кнопки не найден номер")

func _pressed():
	if not self.disabled:
		self.set_disabled(true) # Делаем кнопку ненажимаемой
		emit_send()
	else : pass

func emit_send():
	emit_signal("ololo", self.get_path())
	#print(self.name + ": отправлен сигнал: ololo"  ) #Debug
