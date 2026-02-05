extends Node2D

@onready var status_fome: TextureProgressBar = $"HBoxContainer/Status Fome"
@onready var status_energia: TextureProgressBar = $"HBoxContainer/Status Energia"
@onready var status_felicidade: TextureProgressBar = $"HBoxContainer/Status Felicidade"

func _process(delta: float) -> void:
	status_energia.value = Global.sono
	status_felicidade.value = Global.felicidade
	status_fome.value = Global.fome
