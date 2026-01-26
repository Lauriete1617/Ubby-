extends Sprite2D

@onready var area_2d: Area2D = $Area2D

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().change_scene_to_file("res://Scenes/cozinha.tscn")
