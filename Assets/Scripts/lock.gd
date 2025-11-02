extends StaticBody2D

@export var color : String = "None"
@export var texture : Texture

func _ready() -> void:
	get_node("Sprite2D").texture = texture


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if body.consume_key(self.color):
			body.get_node("UnlockSound").play()
			self.queue_free()
