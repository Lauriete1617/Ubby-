extends AnimatedSprite2D

var velocidade_alegria = 0.5

@onready var sofa: AnimatedSprite2D = $"../Sofa"
@onready var ubby: CharacterBody2D = $"../../Ubby"
@onready var sfx_tv: AudioStreamPlayer2D = $"../../Sons/SFX TV"
@onready var light: PointLight2D = $PointLight2D

func _ready() -> void:
	light.visible = false
	if sfx_tv.stream is AudioStreamWAV:
		sfx_tv.stream.loop_mode = AudioStreamWAV.LOOP_FORWARD
	elif sfx_tv.stream is AudioStreamOggVorbis or sfx_tv.stream is AudioStreamMP3:
		sfx_tv.stream.loop = true

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if not Global.deitado:
			Global.assistindo_tv = not Global.assistindo_tv
			if Global.assistindo_tv:
				light.visible = true
				play("Ligada")
				sofa.play("Ocupado")
				ubby.visible = false
				print("TV ligada!")
				sfx_tv.play()
			else:
				light.visible = false
				play("default")
				sofa.play("default")
				ubby.visible = true
				print("TV desligada!")
				sfx_tv.stop()
		else:
			return

func _process(delta: float) -> void:
	if Global.assistindo_tv:
		if Global.felicidade < 100:
			Global.felicidade += velocidade_alegria * delta
		else:
			Global.felicidade = 100
