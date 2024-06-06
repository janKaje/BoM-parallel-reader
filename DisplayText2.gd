extends RichTextLabel

var chapters = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var json = JSON.new()
	var json_str = Globals.new().get("%s_json_str" % Globals.lang_2)
	json.parse(json_str)
	self.chapters = json.data
	self.set_text(self.chapters[Globals.ref_2])

func update_ref():
	self.set_text(self.chapters[Globals.ref_2])
	scroll_to_line(0)

func update_lang():
	var json = JSON.new()
	var json_str = Globals.new().get("%s_json_str" % Globals.lang_2)
	json.parse(json_str)
	self.chapters = json.data
	self.set_text(self.chapters[Globals.ref_2])

func _process(delta):
	if Globals.locked:
		if Globals.ref_2 != Globals.ref_1:
			Globals.set_ref_2(Globals.ref_1)
			update_ref()
		var scroll = get_v_scroll_bar()
		scroll.set_value(Globals.scrollval * (scroll.max_value - 566))


func _on_language_select_2_item_clicked(index, at_position, mouse_button_index):
	if mouse_button_index == 1:
		Globals.set_lang_2(Globals.language_codes[index])
		update_lang()
		self.show()


func _on_reference_select_2_item_clicked(index, at_position, mouse_button_index):
	if mouse_button_index == 1:
		Globals.set_ref_2(Globals.chapter_code_list[index])
		update_ref()
		self.show()


func _on_language_select_2_empty_clicked(at_position, mouse_button_index):
	if mouse_button_index == 1:
		self.hide()


func _on_reference_select_2_empty_clicked(at_position, mouse_button_index):
	if mouse_button_index == 1:
		self.hide()


func _on_reference_2_pressed():
	self.hide()


func _on_langauge_2_pressed():
	self.hide()


func _on_reference_select_1_item_clicked(index, at_position, mouse_button_index):
	if Globals.locked and mouse_button_index == 1:
		Globals.set_ref_2(Globals.chapter_code_list[index])
		update_ref()
		self.show()
