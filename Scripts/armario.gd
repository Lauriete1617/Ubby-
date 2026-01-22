extends AnimatedSprite2D

var porta_aberta = false
@onready var sfx_armário: AudioStreamPlayer2D = $"../../Sons/SFX Armário"

func _ready() -> void:
	if not porta_aberta:
		play("default")

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if porta_aberta:
		return

	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		porta_aberta = true
		sfx_armário.play()
		play("Abrir")
		await animation_finished
		get_tree().change_scene_to_file("res://Scenes/central_de_estilo.tscn")
