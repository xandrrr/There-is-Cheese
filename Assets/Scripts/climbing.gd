extends State

var player : CharacterBody2D
const CLIMBING_SPEED : int = 20000

func enter(previous_state_path: String, data := {}) -> void:
	player = get_tree().get_first_node_in_group("Player")
	player.get_node("AnimationPlayer").play("grounded")


func physics_update(delta: float) -> void:
	var climbing_axis = Input.get_axis("up","down")
	
	player.velocity.y = climbing_axis * CLIMBING_SPEED * delta
