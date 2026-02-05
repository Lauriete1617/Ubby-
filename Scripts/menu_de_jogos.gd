extends Control

@onready var sfx_botão: AudioStreamPlayer2D = $"SFX Botão"
@onready var título_jogo: Label = $Background/Panel/título_jogo
@onready var sobre_jogo_selecionado: VBoxContainer = $"Background/Panel/Sobre jogo selecionado"
@onready var descrição_jogo: Label = $"Background/Panel/Sobre jogo selecionado/descrição_jogo"

func _on_menu_pressed() -> void:
	print("Menu")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/menu_principal.tscn")

func _on_botão_jogar_pressed() -> void:
	print("Jogar")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/jogo_chovendo_moedas.tscn")
