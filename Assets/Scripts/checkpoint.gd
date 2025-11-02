class_name Checkpoint extends Area2D

@export var activated : bool = false
@export var unactivated_sprite : Texture
@export var activated_sprite : Texture


func _ready():
	get_node("Sprite2D").texture = unactivated_sprite


func _on_body_entered(body: Node2D) -> void:
	if not activated and body.is_in_group("Player"):
		activated = true
		body.get_node("CheckpointAnimationPlayer").play("checkpoint_reached")
		get_node("Sprite2D").texture = activated_sprite
		get_tree().root.get_node("Level").change_checkpoint.emit(self)
