extends AnimatedSprite2D

var abajur_aceso = true
var velocidade_descanso = 0.5

@onready var ubby: CharacterBody2D = $"../../Ubby"
@onready var sfx_abajur: AudioStreamPlayer2D = $"../../Sons/SFX Abajur"
@onready var sfx_ronco: AudioStreamPlayer2D = $"../../Sons/SFX Ronco"
@onready var light: PointLight2D = $PointLight2D

func _ready() -> void:
	light.visible = false
	play("Apagado (Vazio)")

func atualizar_visual():
	if Global.deitado:
		if abajur_aceso:
			light.visible = true
			sfx_abajur.play()
			play("Aceso (Ocupado)")
			sfx_ronco.play()
		else:
			light.visible = false
			sfx_abajur.play()
			play("Apagado (Ocupado)")
			sfx_ronco.play()
	else:
		if abajur_aceso:
			light.visible = true
			sfx_abajur.play()
			play("Aceso (Vazio)")
			sfx_ronco.stop()
		else:
			light.visible = false
			sfx_abajur.play()
			play("Apagado (Vazio)")
			sfx_ronco.stop()

func _on_abajur_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		abajur_aceso = not abajur_aceso
		atualizar_visual()

func _on_cama_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		if not Global.assistindo_tv:
			if not Global.deitado:
				Global.deitado = true
				ubby.visible = false 
				play("Deitando")
				await animation_finished
				abajur_aceso = false 
				atualizar_visual()
			else:
				Global.deitado = false
				ubby.visible = true
				atualizar_visual()
		else:
			return

func _process(delta: float) -> void:
	if Global.deitado:
		if Global.sono < 100:
			Global.sono += velocidade_descanso * delta
		else:
			Global.sono = 100
