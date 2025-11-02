class_name CollectableKey extends Area2D

@export var color : String = "None"
@export var collected : bool = false
@export var texture : Texture


func _ready() -> void:
	get_node("Sprite2D").texture = texture


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and not collected:
		collected = true
		body.add_key_to_inventory(self)
		body.get_node("KeyPickupSound").play()
		get_node("CollisionShape2D").disabled = true
		get_node("Sprite2D").visible = false
