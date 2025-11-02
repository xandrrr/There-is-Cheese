extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().root.get_node("Level").trigger_level_complete()
