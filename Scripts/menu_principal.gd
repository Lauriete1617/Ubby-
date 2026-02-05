extends Control

@onready var sfx_botão: AudioStreamPlayer2D = $"Sons/SFX botão"
@onready var sfx_sair: AudioStreamPlayer2D = $"Sons/SFX sair"

func _on_botão_iniciar_pressed() -> void:
	print("Começando jogo!")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/casa.tscn")

func _on_botão_opções_pressed() -> void:
	print("Configurações")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/menu_de_configurações.tscn")

func _on_botão_sair_pressed() -> void:
	print("Fechando jogo...")
	sfx_sair.play()
	await sfx_sair.finished
	get_tree().quit()
