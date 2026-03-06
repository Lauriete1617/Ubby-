extends Node2D

@onready var ubby: CharacterBody2D = $Ubby
@onready var spawner_timer: Timer = $"Spawner timer"
@onready var timer_partida: TextureProgressBar = $"Timer partida"
@onready var numero: Label = $"Timer partida/números"
@onready var game_timer: Timer = $"Timer partida/Game Timer"
@onready var sfx_botão: AudioStreamPlayer2D = $"SFX/SFX botão"
@onready var vida_1: TextureRect = $"Background/Vidas visualizador/Vida1"
@onready var vida_2: TextureRect = $"Background/Vidas visualizador/Vida2"
@onready var vida_3: TextureRect = $"Background/Vidas visualizador/Vida3"
@onready var pause_tela: VBoxContainer = $"Background/Panel/Pause tela"

var jogo_ativo = true

# --- ITENS SPAWNADOS ---
var cena_moeda = preload("res://Scenes/moeda.tscn")
var cena_bomba = preload("res://Scenes/bomba.tscn")
var cena_saco_moedas = preload("res://Scenes/saco_moedas.tscn")
# --- VARIAVEIS JOGO ---
var dinheiro = 0
var vidas = 3
var score = 0
# --- INTERFACE GRÁFICA ---
@onready var panel: Panel = $Background/Panel
@onready var game_over_tela: VBoxContainer = $"Background/Panel/Game over tela"
	# Game Over
@onready var titulo: Label = $"Background/Panel/Game over tela/Título"
@onready var moedas_texto: Label = $"Background/Panel/Game over tela/Moedas/Moedas texto"
@onready var vidas_texto: Label = $"Background/Panel/Game over tela/Vidas/Vidas texto"
@onready var score_text: Label = $"Background/Panel/Game over tela/Score"

func _ready() -> void:
	panel.visible = false
	game_over_tela.visible = false
	pause_tela.visible = false
	randomize()
	ubby.jogando = true
	ubby.atualizar_slot_individual(ubby.slot_chapeu, "cesto_cabeça", ubby.catalogo_chapeu)
	atualizar_vidas()
	AudioManager.tocar("minijogo")
	Global.pode_desmaiar = false

func _process(delta: float) -> void:
	var tempo = game_timer.time_left
	numero.text = str(int(ceil(tempo)))
	timer_partida.value = tempo

func _on_pause_pressed() -> void:
	sfx_botão.play()
	pause()

func coletar_item(tipo):
	if not jogo_ativo:
		return
	if tipo == "moeda":
		dinheiro += 1
		score += 10
	if tipo == "bomba":
		vidas -= 1
		score -= 50
		animacao_dano()
		atualizar_vidas()
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
	game_timer.stop()
	ubby.jogando = false
	ubby.animation.play("Idle")
	print("Fim de jogo! Score: " + str(score))
	tela_game_over()
	Global.felicidade += 30

func _on_spawner_timer_timeout() -> void:
	if not jogo_ativo:
		return
		
	# --- Criação dos Itens (Mantém igual) ---
	var sorteio = randi() % 100
	var novo_item
	if sorteio < 60:
		novo_item = cena_moeda.instantiate()
	elif sorteio < 90:
		novo_item = cena_bomba.instantiate()
	else:
		novo_item = cena_saco_moedas.instantiate()
	
	novo_item.position = Vector2(randf_range(20, 315), -50)
	add_child(novo_item)
	
	if game_timer.time_left <= 10:
		spawner_timer.wait_time = 0.3 # Modo Pânico! 🔥
	elif game_timer.time_left <= 20:
		spawner_timer.wait_time = 0.4 # Muito Rápido
	elif game_timer.time_left <= 30:
		spawner_timer.wait_time = 0.5 # Rápido

func _on_game_timer_timeout() -> void:
	Global.moedas += dinheiro
	score += vidas * 100
	Global.sono -= 20
	if score > Global.recorde_chovendo_moedas:
		Global.recorde_chovendo_moedas = score
		score_text.text =  "Novo recorde: " + str(score)
	Global.salvar_jogo()
	game_over()

func atualizar_vidas():
	if vidas == 3:
		vida_1.modulate.a = 1
		vida_2.modulate.a = 1
		vida_3.modulate.a = 1
	elif vidas == 2:
		vida_1.modulate.a = 1
		vida_2.modulate.a = 1
		vida_3.modulate.a = 0
	elif vidas == 1:
		vida_1.modulate.a = 1
		vida_2.modulate.a = 0
		vida_3.modulate.a = 0
	else:
		vida_1.modulate.a = 0
		vida_2.modulate.a = 0
		vida_3.modulate.a = 0

func tela_game_over():
	panel.visible = true
	game_over_tela.visible = true
	titulo.text = "Game Over"
	moedas_texto.text = "Moedas: " + str(dinheiro)
	vidas_texto.text = "Vidas: " + str(vidas)
	score_text.text = "Score: " + str(score)

# Botões da tela de game over
func _on_botão_jogar_pressed() -> void:
	print("Jogar novamente")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().reload_current_scene()

func _on_botão_sair_pressed() -> void:
	print("Voltando pra casa")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/casa.tscn")

# Tela de pause
func pause():
	var novo_estado = not get_tree().paused
	get_tree().paused = novo_estado
	panel.visible = novo_estado
	pause_tela.visible = novo_estado

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause") and not game_over_tela.visible:
			pause()

func _on_botão_play_pressed() -> void:
	print("Continuar de onde parou")
	sfx_botão.play()
	await sfx_botão.finished
	pause()

func _on_botão_recomeçar_pressed() -> void:
	print("Reiniciando minigame")
	get_tree().paused = false
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().reload_current_scene()

func _on_botão_fechar_pressed() -> void:
	print("Fechando minijogo")
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu_de_jogos.tscn")

func animacao_dano():
	ubby.modulate = Color(1,0,0)
	await get_tree().create_timer(0.2).timeout
	ubby.modulate = Color(1,1,1)
