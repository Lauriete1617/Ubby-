extends Control

@onready var sfx_botão: AudioStreamPlayer2D = $"SFX Botão"

func _on_botão_jogar_pressed() -> void:
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/jogo_chovendo_moedas.tscn")

func _on_casa_pressed() -> void:
	print("Voltando pra casa")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/casa.tscn")
