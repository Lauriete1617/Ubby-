# CASA
extends Node2D

@onready var sfx_botão: AudioStreamPlayer2D = $"Sons/SFX Botão"
@onready var ubby: CharacterBody2D = $Ubby
@onready var tela_preta: ColorRect = $"UI/Tela Preta"

func _ready() -> void:
	ubby.na_sala = true
	AudioManager.tocar("casa")
	Global.pode_desmaiar = true
	if not Global.ubby_desmaiou.is_connected(iniciar_desmaio):
		Global.ubby_desmaiou.connect(iniciar_desmaio)
	tela_preta.visible = true
	tela_preta.modulate.a = 0.0
	tela_preta.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _on_configurações_pressed() -> void:
	print("Configurações")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/menu_de_configurações.tscn")

func _on_menu_pressed() -> void:
	print("Menu principal")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/menu_principal.tscn")

func _on_minijogo_pressed() -> void:
	print("Bora jogar!")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/menu_de_jogos.tscn")

func _on_hospital_pressed() -> void:
	print("Indo pro hospital")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/hospital.tscn")

func _exit_tree() -> void:
	Global.pode_desmaiar = false
	if Global.ubby_desmaiou.is_connected(iniciar_desmaio):
		Global.ubby_desmaiou.disconnect(iniciar_desmaio)

func iniciar_desmaio():
	# 1. Travar tudo
	tela_preta.mouse_filter = Control.MOUSE_FILTER_STOP
	set_process(false)
	ubby.set_process(false)
	print("Ubby desmaiou! Chamem a ambulância!")
	# 2. Ubby faz seu drama
	ubby.animation.play("Passando Mal")
	ubby.animation.frame = 7
	ubby.animation.pause()
	# 3. Tela preta e som de queda
	AudioManager.fade_out()
	var tween = create_tween()
	tween.tween_property(tela_preta, "modulate:a", 1.0, 2.0) # Escurece em 2 segundos
	await tween.finished
	if ubby.sfx_desmaio: 
		ubby.sfx_desmaio.play()
		await ubby.animation.animation_finished
	# 4. Vai pro hospital
	Global.aplica_penalidade_desmaio() 
	get_tree().change_scene_to_file("res://Scenes/hospital.tscn")
