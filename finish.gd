extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" :
		$CollisionShape2D.set_deferred("disabled", true)
		global.main_node.result_level()
		print("restart")
