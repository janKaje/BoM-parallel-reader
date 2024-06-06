extends RichTextLabel

var chapters = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var json = JSON.new()
	var json_str = Globals.new().get("%s_json_str" % Globals.lang_1)
	json.parse(json_str)
	self.chapters = json.data
	self.set_text(self.chapters[Globals.ref_1])
	
	#self.append_text("text [table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]ちょう[/font_size][/center][/cell][cell]長[/cell][cell][/cell][/table] next\n")
	#self.append_text("text [table=1,l,l,1][cell padding=0,0,0,-5][center][font_size=10]on top[/font_size][/center][/cell][cell]base text[/cell][cell][/cell][/table] next")

	#self.set_text("「[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]せい[/font_size][/center][/cell][cell]聖[/cell][cell][/cell][/table]なる，[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]せい[/font_size][/center][/cell][cell]聖[/cell][cell][/cell][/table]なる[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]かみ[/font_size][/center][/cell][cell]神[/cell][cell][/cell][/table]よ，わたしたちはあなたが[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]かみ[/font_size][/center][/cell][cell]神[/cell][cell][/cell][/table]でましますことを[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]しん[/font_size][/center][/cell][cell]信[/cell][cell][/cell][/table]じています。あなたが[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]せい[/font_size][/center][/cell][cell]聖[/cell][cell][/cell][/table]なる[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]お[/font_size][/center][/cell][cell]御[/cell][cell][/cell][/table][table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]かた[/font_size][/center][/cell][cell]方[/cell][cell][/cell][/table]であり，あなたが[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]か[/font_size][/center][/cell][cell]過[/cell][cell][/cell][/table][table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]こ[/font_size][/center][/cell][cell]去[/cell][cell][/cell][/table]に[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]れい[/font_size][/center][/cell][cell]霊[/cell][cell][/cell][/table]であり，[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]げん[/font_size][/center][/cell][cell]現[/cell][cell][/cell][/table][table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]ざい[/font_size][/center][/cell][cell]在[/cell][cell][/cell][/table]も[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]れい[/font_size][/center][/cell][cell]霊[/cell][cell][/cell][/table]であり，[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]しょう[/font_size][/center][/cell][cell]将[/cell][cell][/cell][/table][table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]らい[/font_size][/center][/cell][cell]来[/cell][cell][/cell][/table]もとこしえに[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]れい[/font_size][/center][/cell][cell]霊[/cell][cell][/cell][/table]であられることを，わたしたちは[table=1,l,l,1][cell padding=0,0,0,-6][center][font_size=10]しん[/font_size][/center][/cell][cell]信[/cell][cell][/cell][/table]じています。")

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

