extends Node2D

@export var current_checkpoint : Checkpoint
@export var current_player : Player_Character

signal change_checkpoint(checkpoint : Checkpoint)


func _on_change_checkpoint(checkpoint: Checkpoint) -> void:
	current_checkpoint = checkpoint


func trigger_level_complete():
	get_node("TileMapLayer").queue_free()
	get_node("Interactables").queue_free()
	get_node("Platforms").queue_free()
	get_node("Player").queue_free()
	get_node("Cheese").get_node("AnimationPlayer").play("level_complete")
	await get_tree().create_timer(3.0).timeout
	get_node("BlackRectangleLayer").get_node("AnimationPlayer").play("fade_out")
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://Levels/second_level.tscn")
	
