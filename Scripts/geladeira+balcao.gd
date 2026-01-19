extends AnimatedSprite2D

@onready var area_2d: Area2D = $Area2D
@onready var sfx_geladeira: AudioStreamPlayer2D = $"../../Sons/SFX Geladeira"

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed() and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		sfx_geladeira.play()
		play("Abrindo")
		await animation_finished
		get_tree().change_scene_to_file("res://Scenes/mercado.tscn")
