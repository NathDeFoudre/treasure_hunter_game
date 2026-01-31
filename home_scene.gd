extends Control

var node_main_path = "res://main.tscn"


func _on_play_pressed() -> void:
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file(node_main_path)

func _on_quit_pressed() -> void:
	get_tree().quit()
