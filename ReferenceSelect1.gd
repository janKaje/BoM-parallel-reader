extends ItemList


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	for chaptertext in Globals.chapter_list:
		self.add_item(chaptertext)


func _on_reference_1_pressed():
	self.show()


func _on_empty_clicked(at_position, mouse_button_index):
	if mouse_button_index == 1:
		self.hide()


func _on_item_clicked(index, at_position, mouse_button_index):
	if mouse_button_index == 1:
		self.hide()
