extends Area2D

@export var currently_active : bool = false
@export var current_dialogue : int = 0

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and not currently_active:
		current_dialogue += 1
		currently_active = true
		get_node("DialogueTimer").start()
		get_node("Dialogue").visible = true


func _on_dialogue_timer_timeout() -> void:
	current_dialogue = 0
	currently_active = false
	get_node("Dialogue").visible = false
