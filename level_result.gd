extends CanvasLayer


@onready var coin_result_node = $MarginContainer/VBoxContainer2/VBoxContainer/VBoxContainer/coinEarned
@onready var time_node = $MarginContainer/VBoxContainer2/VBoxContainer/VBoxContainer/time

func _ready() -> void:
	visible = false
	
func load_result_level (coin : int, time : float):
	get_tree().paused = true
	visible = true
	coin_result_node.text = "Coin Earned : " + str(coin)
	time_node.text = str(time)


func _on_restart_pressed() -> void:
	print('restart')
	global.main_node.restart_level()


func _on_next_pressed() -> void:
	print('next')
	global.main_node.next_level()
