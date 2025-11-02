extends State

var player : CharacterBody2D


func enter(previous_state_path: String, data := {}) -> void:
	player = get_tree().get_first_node_in_group("Player")
	player.get_node("AnimationPlayer").play("grounded")


func physics_update(delta: float) -> void:
	if Input.get_action_strength("up") == 1:
		player.velocity.y -= 600
		player.get_node("JumpSound").play()
		self.finished.emit("Airborne")
	
	if not player.is_on_floor():
		self.finished.emit("Airborne")
