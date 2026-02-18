extends Node2D

@onready var sfx_botão: AudioStreamPlayer2D = $"Sons/SFX Botão"
@onready var ubby: CharacterBody2D = $Ubby

func _ready() -> void:
	ubby.na_sala = true
	AudioManager.tocar("casa")

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
