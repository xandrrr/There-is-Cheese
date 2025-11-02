extends Area2D

@export var currently_active : bool = false
@export var current_dialogue : int = 0
@export var current_player : Node2D
@export var teleport_point : Node2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and not currently_active:
		current_dialogue += 1
		currently_active = true
		get_node("Dialogue").texture = get_node("Dialogue").dialogue1
		get_node("DialogueTimer").start()
		get_node("Dialogue").visible = true
		current_player = body


func _on_dialogue_timer_timeout() -> void:
	match current_dialogue:
		1: 
			current_dialogue = 2
			get_node("Dialogue").texture = get_node("Dialogue").dialogue2
			get_node("DialogueTimer").start()
		2: 
			current_dialogue = 0
			currently_active = false
			get_node("Dialogue").visible = false
			current_player.position = teleport_point.position
			
