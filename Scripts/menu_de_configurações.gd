extends Control

@onready var sfx_botão: AudioStreamPlayer2D = $"Sons/SFX botão"
@onready var menu: VBoxContainer = $Background/Panel/Menu
@onready var sfx_apagar: AudioStreamPlayer2D = $"Sons/SFX apagar"
@onready var botão_resetar: Button = $"Background/Panel/Menu/Botão resetar"
@onready var aviso: VBoxContainer = $Background/Panel/Aviso
@onready var ícone_sfx: TextureRect = $"Background/Panel/Ícone SFX"
@onready var ícone_música: TextureRect = $"Background/Panel/Ícone Música"
@onready var volume_sfx: HSlider = $"Background/Panel/Menu/Volume SFX"
@onready var volume_música: HSlider = $"Background/Panel/Menu/Volume Música"
@onready var tela_cheia: CheckButton = $"Background/Panel/Menu/Tela cheia"

var sfx_bus_index
var musica_bus_index
var arquivo_save = "user://savegame.save"

func _ready() -> void:
	menu.visible = true
	aviso.visible = false
	atualizar_botao_save()
	volume_música.value = Global.vol_musica
	volume_sfx.value = Global.vol_sfx
	tela_cheia.button_pressed = Global.fullscreen

func _on_menu_pressed() -> void:
	print("Voltando ao menu principal")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/menu_principal.tscn")

func _on_casa_pressed() -> void:
	print("Indo pra casa")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/casa.tscn")

func _on_tela_cheia_toggled(button_pressed) -> void:
	Global.fullscreen = button_pressed
	Global.aplicar_video()
	Global.salvar_config()

func _on_volume_sfx_value_changed(value: float) -> void:
	Global.vol_sfx = value
	Global.aplicar_audio()
	Global.salvar_config()

func _on_volume_música_value_changed(value: float) -> void:
	Global.vol_musica = value
	Global.aplicar_audio()
	Global.salvar_config()

func _on_botão_resetar_pressed() -> void:
	sfx_botão.play()
	await sfx_botão.finished
	menu.visible = false
	aviso.visible = true
	ícone_música.visible = false
	ícone_sfx.visible = false

func _on_botão_não_pressed() -> void:
	menu.visible = true
	aviso.visible = false
	ícone_música.visible = true
	ícone_sfx.visible = true

func _on_botão_sim_pressed() -> void:
	sfx_apagar.play()
	await sfx_apagar.finished
	if FileAccess.file_exists(arquivo_save):
		DirAccess.remove_absolute(arquivo_save)
		print("Arquivo deletado com sucesso!")
	Global.resetar_dados()
	menu.visible = true
	aviso.visible = false
	ícone_música.visible = true
	ícone_sfx.visible = true
	atualizar_botao_save()

func atualizar_botao_save():
	if FileAccess.file_exists(arquivo_save):
		botão_resetar.disabled = false
		botão_resetar.text = "Apagar salvamento"
	else:
		botão_resetar.disabled = true
		botão_resetar.text = "Sem dados salvos"
