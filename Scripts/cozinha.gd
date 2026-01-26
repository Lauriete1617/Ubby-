extends Node2D

@onready var prato_animation: AnimatedSprite2D = $"Prato selecionado/AnimatedSprite2D"
@onready var ubby: CharacterBody2D = $Ubby
@onready var prato: Area2D = $"Prato selecionado"
@onready var boca: Marker2D = $Boca
@onready var quantidade_label: Label = $"Prato selecionado/Quantidade label"

# --- EFEITOS SONOROS ---
@onready var sfx_botões: AudioStreamPlayer2D = $"Sons/SFX Botões"
@onready var sfx_sair: AudioStreamPlayer2D = $"Sons/SFX Sair"
@onready var sfx_comer: AudioStreamPlayer2D = $"Sons/SFX Comer"

var lista_ids = []
var indice_atual = 0
var arrastando = false
var posicao_prato_inicio

var ajuste_escala = {
	"brigadeiro": Vector2 (0.5, 0.5),
	"pao_queijo": Vector2 (0.6, 0.6),
	"la_minuta": Vector2 (1.2, 1.2),
	"chimarrao": Vector2 (0.9, 0.9),
	"coxinha": Vector2 (0.6, 0.6),
	"salada_frutas": Vector2 (0.8, 0.8),
	"cafe": Vector2 (0.7, 0.7),
	"cha": Vector2 (0.7, 0.7),
	"xis": Vector2 (1.1, 1.1),
	"guarana": Vector2 (0.7, 0.7),
	"massa": Vector2 (1.2, 1.2),
	"acai": Vector2 (0.9, 0.9)
}

func _ready() -> void:
	ubby.animation.play("Esperando comida")
	carregar_lista_comidas()
	atualizar_prato()

func _process(delta: float) -> void:
	if arrastando:
		prato.global_position = get_global_mouse_position()

func carregar_lista_comidas():
	lista_ids = Global.inventario_comidas.keys()
	if lista_ids.size() == 0:
		prato.visible = false
		print("Inventário vazio")
	else:
		prato.visible = true
		# Garante que o índice não estoure se a lista diminuiu
		if indice_atual >= lista_ids.size():
			indice_atual = 0
		atualizar_prato()

func atualizar_prato():
	if lista_ids.size() == 0:
		return
	var nome_comida = lista_ids[indice_atual]
	prato_animation.play(nome_comida)
	prato_animation.frame = 0
	prato_animation.stop()
	if ajuste_escala.has(nome_comida):
		prato_animation.scale = ajuste_escala[nome_comida]
	else:
		prato_animation.scale = Vector2 (1.0, 1.0)

func _on_botão_direita_pressed() -> void:
	print("Botão direito pressionado")
	indice_atual += 1
	if indice_atual >= lista_ids.size():
		indice_atual = 0
	sfx_botões.play()
	atualizar_prato()

func _on_botão_esquerda_pressed() -> void:
	print("Botão esquerdo pressionado")
	indice_atual -= 1
	if indice_atual < 0:
		indice_atual = lista_ids.size() - 1
	sfx_botões.play()
	atualizar_prato()

func _on_fechar_pressed() -> void:
	print("Terminei a refeição")
	sfx_sair.play()
	await sfx_sair.finished
	get_tree().change_scene_to_file("res://Scenes/casa.tscn")

func _on_prato_selecionado_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			arrastando = true
			posicao_prato_inicio = prato.global_position
			print("Pegou a comida")
		else:
			arrastando = false
			print("Soltou a comida")
			verificar_comida()

func verificar_comida():
	var distancia = prato.global_position.distance_to(boca.global_position)
	if distancia < 12:
		comer()
	else:
		devolver_mesa()

func comer():
	sfx_comer.play()
	ubby.animation.play("Comendo")
	prato_animation.play()
	await prato_animation.animation_finished
	devolver_mesa()

func devolver_mesa():
	var tween = create_tween()
	tween.tween_property(prato, "global_position", posicao_prato_inicio, 0.2)
	ubby.animation.play("Esperando comida")
