extends Node2D

@onready var cama: Area2D = $AnimatedSprite2D/Cama
@onready var abajur: Area2D = $AnimatedSprite2D/Abajur
@onready var monitor: Area2D = $Cenário/Monitor
@onready var compra: Area2D = $Remédios/Compra
@onready var text_moedas: Label = $Moedas
@onready var ubby: CharacterBody2D = $Ubby

func _ready() -> void:
	atualizar_moedas()

func atualizar_moedas():
	text_moedas.text = str(Global.moedas)
