extends Control

var dpath:String = ""

func _on_lock_unlock_pressed():
	Globals.switch_lock()

func get_save_dict():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"ref_1" : Globals.ref_1,
		"ref_2" : Globals.ref_2,
		"lang_1": Globals.lang_1,
		"lang_2": Globals.lang_2,
		"locked": Globals.locked,
	}
	return save_dict

func save():
	var save_dict = get_save_dict()
	var save_file = FileAccess.open("res://savegame.save", FileAccess.WRITE)
	save_file.store_var(save_dict)
	return

func quit():
	save()
	get_tree().quit()
	
func loadsave():
	
	if not FileAccess.file_exists("res://savegame.save"):
		return # Error! We don't have a save to load.
		
	var save_file = FileAccess.open("res://savegame.save", FileAccess.READ)
	var save_data = save_file.get_var()
	
	Globals.set_ref_1(save_data["ref_1"])
	Globals.set_ref_2(save_data["ref_2"])
	Globals.set_lang_1(save_data["lang_1"])
	Globals.set_lang_2(save_data["lang_2"])
	Globals.locked = save_data["locked"]
	
	return
	
func _ready():
	loadsave()
	
	print(Globals.lang_1)
	print(Globals.lang_2)
	
	for lang_code in Globals.language_codes:
		if FileAccess.file_exists("res://languages/%s.json" % lang_code):
			Globals.add_downloaded_language(lang_code)
	
	
	
func download_new_lang(lang_code:String):
	print("res://languages/%s.json" % lang_code)
	self.dpath = "res://languages/%s.json" % lang_code
	var http = HTTPRequest.new()
	add_child(http)
	http.request_completed.connect(_on_request_completed)
	http.request("https://github.com/janKaje/Languages-of-the-Book-of-Mormon/raw/main/data/%s.json" % lang_code)

func _on_request_completed(result, response_code, headers, body):
	if result != OK:
		push_error("Download Failed")
	var text = body.get_string_from_utf8()
	var downloadpath = FileAccess.open(self.dpath, FileAccess.WRITE)
	downloadpath.store_string(text)
	remove_child($HTTPRequest)
	
	
func _on_quit_pressed():
	quit()
