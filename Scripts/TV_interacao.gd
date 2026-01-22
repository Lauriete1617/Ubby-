extends AnimatedSprite2D

var tv_ligada = false
@onready var sofa: AnimatedSprite2D = $"../Sofa"
@onready var ubby: CharacterBody2D = $"../../Ubby"
@onready var sfx_tv: AudioStreamPlayer2D = $"../../Sons/SFX TV"

func _ready() -> void:
	# Se o arquivo for WAV
	if sfx_tv.stream is AudioStreamWAV:
		sfx_tv.stream.loop_mode = AudioStreamWAV.LOOP_FORWARD
		
	# Se o arquivo for OGG ou MP3
	elif sfx_tv.stream is AudioStreamOggVorbis or sfx_tv.stream is AudioStreamMP3:
		sfx_tv.stream.loop = true

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		tv_ligada = not tv_ligada
		if tv_ligada:
			play("Ligada")
			sofa.play("Ocupado")
			ubby.visible = false
			print("TV ligada!")
			sfx_tv.play()
		else:
			play("default")
			sofa.play("default")
			ubby.visible = true
			print("TV desligada!")
			sfx_tv.stop()
