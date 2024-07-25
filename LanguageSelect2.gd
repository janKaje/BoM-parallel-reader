extends ItemList


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()

func update_language_display():
	self.clear()
	for language_name in Globals.languages_downloaded:
		self.add_item(language_name)

func _on_langauge_2_pressed():
	self.show()


func _on_item_clicked(index, at_position, mouse_button_index):
	if mouse_button_index == 1:
		self.hide()


func _on_empty_clicked(at_position, mouse_button_index):
	if mouse_button_index == 1:
		self.hide()
		

func _on_main_ready():
	update_language_display()
