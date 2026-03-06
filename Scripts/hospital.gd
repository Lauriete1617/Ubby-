extends Node2D

# OBJETOS
@onready var cama_abajur: AnimatedSprite2D = $"Cama+Abajur"
@onready var cama: Area2D = $AnimatedSprite2D/Cama
@onready var abajur: Area2D = $AnimatedSprite2D/Abajur
@onready var monitor: Area2D = $Cenário/Monitor
@onready var ubby: CharacterBody2D = $Ubby
@onready var light: PointLight2D = $"Cama+Abajur/Abajur/PointLight2D"
# INTERFACE GRÁFICA (UI)
@onready var compra: Area2D = $Remédios/Compra
@onready var text_moedas: Label = $UI/Moedas
@onready var nome_remédio: Label = $"UI/Interface compra/Fundo/Panel grande/Sobre remédio/Nome remédio"
@onready var imagem_remédio: TextureRect = $"UI/Interface compra/Fundo/Panel grande/Sobre remédio/Imagem remédio"
@onready var preço: Label = $"UI/Interface compra/Fundo/Panel grande/Sobre remédio/Preço"
@onready var interface_compra: Node2D = $"UI/Interface compra"
@onready var botão_compra: Button = $"UI/Interface compra/Fundo/Panel grande/Sobre remédio/Botão compra"
# EFEITOS SONOROS (SFX)
@onready var sfx_abajur: AudioStreamPlayer2D = $"SFX/SFX abajur"
@onready var sfx_ronco: AudioStreamPlayer2D = $"SFX/SFX ronco"
@onready var sfx_botão: AudioStreamPlayer2D = $"SFX/SFX botão"
@onready var sfx_compra: AudioStreamPlayer2D = $"SFX/SFX compra"
@onready var sfx_monitor: AudioStreamPlayer2D = $"SFX/SFX monitor"
# VARIÁVEIS
var aceso = true
var dormindo = false
var remedio_selecionado = "kit_completo"
var preco_remedio_selecionado = 500

func _ready() -> void:
	atualizar_moedas()
	interface_compra.visible = false
	Global.salvar_jogo()
	AudioManager.tocar("hospital")
	ubby.atualizar_slot_individual(ubby.slot_roupa, "roupa_hospital", ubby.catalogo_roupa)
	sfx_monitor.play()
	Global.pode_desmaiar = false

func _process(delta: float) -> void:
	if dormindo:
		sfx_ronco.play()
		if Global.sono < 100:
			Global.sono += 0.5 * delta
		else:
			Global.sono = 100
	else:
		sfx_ronco.stop()
		return

#LÓGICA CAMA E ABAJUR
func atualizar_visual_ubby():
	if aceso:
		light.visible = true
		if dormindo:
			cama_abajur.play("Ocupado (Aceso)")
		else:
			cama_abajur.play("Vazio (Aceso)")
	else:
		light.visible = false
		if dormindo:
			cama_abajur.play("Ocupado (Apagado)")
		else:
			cama_abajur.play("Vazio (Apagado)")

func _on_cama_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed() and InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not dormindo:
			ubby.visible = false
			cama_abajur.play("Deitando")
			await cama_abajur.animation_finished
		else:
			ubby.visible = true
		dormindo = not dormindo
		atualizar_visual_ubby()

func _on_abajur_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed() and InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		aceso = not aceso
		atualizar_visual_ubby()

# LÓGICA COMPRA
func _on_compra_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed() and InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		interface_compra.visible = true
		light.visible = false
		atualizar_botao()

func _on_kit_completo_pressed() -> void:
	sfx_botão.play()
	await sfx_botão.finished
	remedio_selecionado = "kit_completo"
	preco_remedio_selecionado = 500
	nome_remédio.text = "Kit Completo"
	imagem_remédio.texture = load("res://Assets/Sprites/Itens/Kit saúde.png")
	preço.text = " " + str(preco_remedio_selecionado)

func _on_alegria_pressed() -> void:
	sfx_botão.play()
	await sfx_botão.finished
	remedio_selecionado = "felicidade"
	preco_remedio_selecionado = 250
	nome_remédio.text = "Alegria"
	imagem_remédio.texture = load("res://Assets/Sprites/Itens/Remédio felicidade.png")
	preço.text = " " + str(preco_remedio_selecionado)

func _on_energia_pressed() -> void:
	sfx_botão.play()
	await sfx_botão.finished
	remedio_selecionado = "energia"
	preco_remedio_selecionado = 350
	nome_remédio.text = "Energia"
	imagem_remédio.texture = load("res://Assets/Sprites/Itens/Remédio sono.png")
	preço.text = " " + str(preco_remedio_selecionado)

func _on_fome_pressed() -> void:
	sfx_botão.play()
	await sfx_botão.finished
	remedio_selecionado = "fome"
	preco_remedio_selecionado = 200
	nome_remédio.text = "Fome"
	imagem_remédio.texture = load("res://Assets/Sprites/Itens/Remédio fome.png")
	preço.text = " " + str(preco_remedio_selecionado)

func _on_botão_compra_pressed() -> void:
	if Global.moedas >= preco_remedio_selecionado:
		Global.moedas -= preco_remedio_selecionado
		sfx_compra.play()
		await sfx_compra.finished
	atualizar_botao()
	atualizar_moedas()
	Global.salvar_jogo()
	if Global.inventario_remedios.has(remedio_selecionado):
		Global.inventario_remedios[remedio_selecionado] += 1
	else:
		print("ERRO: Remédio não encontrado")

func atualizar_botao():
	if Global.moedas < preco_remedio_selecionado:
		botão_compra.disabled = true
		botão_compra.text = "Sem dinheiro"
	else:
		botão_compra.disabled = false
		botão_compra.text = "Comprar"

# INTERFACE GRÁFICA
func atualizar_moedas():
	text_moedas.text = str(Global.moedas)

func _on_botão_voltar_pressed() -> void:
	sfx_botão.play()
	await sfx_botão.finished
	interface_compra.visible = false
	atualizar_visual_ubby()

func _on_botão_casa_pressed() -> void:
	sfx_monitor.stop()
	sfx_botão.play()
	await sfx_botão.finished
	get_tree().change_scene_to_file("res://Scenes/casa.tscn")
