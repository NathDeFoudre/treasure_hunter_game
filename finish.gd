extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" :
		global.main_node.result_level()
