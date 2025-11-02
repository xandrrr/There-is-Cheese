class_name Player_Character extends CharacterBody2D

@export var gravity : float = 980.0
@export var max_speed : float = 1600.0
@export var acceleration : float = 2.0
@export var friction : float = 16.0

signal climbing_toggled(toggled : bool)

var inventory = []


func _ready() -> void:
	add_to_group("Player")


func update_player_velocity(delta : float):
	var x_axis_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	var x_weight = 1.0 - exp(-(self.acceleration if x_axis_input else self.friction) * delta)
	
	self.velocity.x = lerp(self.velocity.x, x_axis_input * self.max_speed, x_weight)
	
	if x_axis_input == 1:
		self.get_node("Sprite2D").flip_h = true
	elif x_axis_input == -1:
		self.get_node("Sprite2D").flip_h = false


func _physics_process(delta : float):
	update_player_velocity(delta)
	move_and_slide()


func consume_key(color : String):
	if not inventory.is_empty():
		for i in range(inventory.size()):
			if inventory[i].color == color:
				var matching_key = inventory[i]
				inventory.remove_at(i)
				matching_key.queue_free()
				return true
	return false


func add_key_to_inventory(new_key : CollectableKey):
	inventory.append(new_key)


func take_damage():
	var level = get_tree().root.get_node("Level")
	var checkpoint = level.current_checkpoint
	
	self.position = checkpoint.position
