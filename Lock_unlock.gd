extends Button
	
func update_text():
	if Globals.locked:
		set_text("Desync")
	else:
		set_text("Sync")


func _on_pressed():
	update_text()


func _on_main_ready():
	update_text()
