extends Node2D

@onready var ubby: CharacterBody2D = $Ubby

func _ready() -> void:
	ubby.animation.play("Esperando comida")
