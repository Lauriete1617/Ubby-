extends Node2D

@onready var ubby: CharacterBody2D = $Ubby
@onready var spawner_timer: Timer = $"Spawner timer"
var jogo_ativo = true

# --- ITENS SPAWNADOS ---
var cena_moeda = preload("res://Scenes/moeda.tscn")
var cena_bomba = preload("res://Scenes/bomba.tscn")
var cena_saco_moedas = preload("res://Scenes/saco_moedas.tscn")
# --- VARIAVEIS JOGO ---
var dinheiro = 0
var vidas = 3
var score = 0

func _ready() -> void:
	randomize()
	ubby.jogando = true
	ubby.atualizar_slot_individual(ubby.slot_chapeu, "cesto_cabeça", ubby.catalogo_chapeu)

func _on_pause_pressed() -> void:
	pass # Replace with function body.

func coletar_item(tipo):
	if not jogo_ativo:
		return
	if tipo == "moeda":
		dinheiro += 1
		score += 10
	if tipo == "bomba":
		vidas -= 1
		score -= 50
		if vidas <= 0:
			game_over()
	if tipo == "saco_moedas":
		dinheiro += 10
		score += 120
	else:
		return

func game_over():
	jogo_ativo = false
	spawner_timer.stop()
	ubby.jogando = false
	ubby.animation.play("Idle")
	print("Fim de jogo! Score: " + str(score))

func _on_spawner_timer_timeout() -> void:
	if not jogo_ativo:
		return
	var sorteio = randi() %100
	var novo_item
	if sorteio < 60:
		novo_item = cena_moeda.instantiate()
	elif sorteio < 90:
		novo_item = cena_bomba.instantiate()
	else:
		novo_item = cena_saco_moedas.instantiate()
	novo_item.position = Vector2(randf_range(20, 315), -50)
	add_child(novo_item)
