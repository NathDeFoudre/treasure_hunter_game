extends CanvasLayer


func _process(delta: float) -> void:
	$MarginContainer/skor.text = "COIN " + str(global.player_node.coin_earn)
	
func _on_pause_pressed() -> void:
	get_tree().paused = true
	$pause_page.visible = true


func _on_pause_page_restart_request() -> void:
	global.main_node.restart_level()
