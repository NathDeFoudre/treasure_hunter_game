extends CanvasLayer

signal restart_request

#resume
func _on_resume_pressed() -> void:
	get_tree().paused = false
	self.visible = false

#restart
func _on_restart_pressed() -> void:
	get_tree().paused = false
	restart_request.emit()
	visible = false

#main menu
func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/home_scene.tscn")	
