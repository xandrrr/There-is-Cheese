class_name Hurtbox extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.get_node("HurtSound").play()
		body.take_damage()
