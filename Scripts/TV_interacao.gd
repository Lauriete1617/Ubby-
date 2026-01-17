extends AnimatedSprite2D

var tv_ligada = false
@onready var sofa: AnimatedSprite2D = $"../Sofa"
@onready var ubby: CharacterBody2D = $"../../Ubby"

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		tv_ligada = not tv_ligada
		if tv_ligada:
			play("Ligada")
			sofa.play("Ocupado")
			ubby.visible = false
			print("TV ligada!")
		else:
			play("default")
			sofa.play("default")
			ubby.visible = true
			print("TV desligada!")
