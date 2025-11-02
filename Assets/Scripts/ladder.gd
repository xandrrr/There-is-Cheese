class_name Ladder extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.climbing_toggled.emit(true)




func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.climbing_toggled.emit(false)
