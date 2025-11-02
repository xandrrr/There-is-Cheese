extends State

var player : CharacterBody2D


func enter(previous_state_path: String, data := {}) -> void:
	player = get_tree().get_first_node_in_group("Player")
	player.get_node("AnimationPlayer").play("airborne")


func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		player.velocity.y += player.gravity * delta
	else: 
		self.finished.emit("Running")
