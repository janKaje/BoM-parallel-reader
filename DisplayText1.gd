extends RichTextLabel

var chapters = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var json = JSON.new()
	var json_str = Globals.new().get("%s_json_str" % Globals.lang_1)
	json.parse(json_str)
	self.chapters = json.data
	self.set_text(self.chapters[Globals.ref_1])


func update_ref():
	self.set_text(self.chapters[Globals.ref_1])
	scroll_to_line(0)

func update_lang():
	var json = JSON.new()
	var json_str = Globals.new().get("%s_json_str" % Globals.lang_1)
	json.parse(json_str)
	self.chapters = json.data
	self.set_text(self.chapters[Globals.ref_1])
	
	
func _process(delta):
	if Globals.locked:
		var scroll = get_v_scroll_bar()
		Globals.set_scrollval(scroll.value / (scroll.max_value - 566))



func _on_item_list_item_clicked(index, at_position, mouse_button_index): #language select
	if mouse_button_index == 1:
		Globals.set_lang_1(Globals.language_codes[index])
		update_lang()
		self.show()

func _on_reference_select_1_item_clicked(index, at_position, mouse_button_index):
	if mouse_button_index == 1:
		Globals.set_ref_1(Globals.chapter_code_list[index])
		update_ref()
		self.show()


func _on_langauge_1_pressed():
	self.hide()


func _on_reference_1_pressed():
	self.hide()


func _on_language_select_1_empty_clicked(at_position, mouse_button_index):
	if mouse_button_index == 1:
		self.hide()


func _on_reference_select_1_empty_clicked(at_position, mouse_button_index):
	if mouse_button_index == 1:
		self.hide()


func _on_reference_select_2_item_clicked(index, at_position, mouse_button_index):
	if Globals.locked and mouse_button_index == 1:
		Globals.set_ref_1(Globals.chapter_code_list[index])
		update_ref()
		self.show()

