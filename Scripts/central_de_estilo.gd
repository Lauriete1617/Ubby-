extends Control

# --- REFERÊNCIAS VISUAIS (UI) ---
@onready var fechar: Button = $Fechar
@onready var text_moedas: Label = $HBoxContainer/Provador/Moedas
@onready var botao_acao: Button = $HBoxContainer/Provador/botao_acao

# --- REFERÊNCIAS DOS MANEQUINS ---
@onready var manequim_oculos = $"HBoxContainer/Provador/ManequimUbby/Manequim_oculos"
@onready var manequim_chapeus: TextureRect = $HBoxContainer/Provador/ManequimUbby/Manequim_chapeus
@onready var manequim_pescoço: TextureRect = $HBoxContainer/Provador/ManequimUbby/Manequim_pescoço
@onready var manequim_sapato: TextureRect = $HBoxContainer/Provador/ManequimUbby/Manequim_sapato
@onready var manequim_roupas: TextureRect = $HBoxContainer/Provador/ManequimUbby/Manequim_roupas

# --- VARIÁVEIS DE CONTROLE ---
var item_selecionado = null 
@export var grades_de_itens: Array[GridContainer]
@onready var ícone_moeda: TextureRect = $"HBoxContainer/Provador/Moedas/Ícone moeda"

# --- SONS ---
@onready var sfx_botão: AudioStreamPlayer2D = $"Sons/SFX Botão"
@onready var sfx_compra: AudioStreamPlayer2D = $"Sons/SFX Compra"
@onready var sfx_sair: AudioStreamPlayer2D = $"Sons/SFX Sair"

func _ready():
	botao_acao.visible = false
	atualizar_moedas_visual()
	
	for grade in grades_de_itens:
		for botao in grade.get_children():
			if botao.has_signal("pressed"):
				botao.pressed.connect(_on_item_clicado.bind(botao))
				if botao.id_item in Global.itens_desbloqueados:
					botao.texto_preço.visible = false
					ícone_moeda.visible = false

func atualizar_moedas_visual():
	text_moedas.text = str(Global.moedas)

# --- QUANDO CLICAS NUM ITEM NA PRATELEIRA ---
func _on_item_clicado(botao):
	limpar_tudo()
	sfx_botão.play()
	print("Item selecionado: ", botao.id_item)
	item_selecionado = botao 
	botao_acao.visible = true # Mostra o botão de ação
	
	# 1. VISUAL: Veste o manequim para testar (Preview)
	match botao.tipo:
		"oculos":
			manequim_oculos.texture = botao.textura_item
		"chapeu":
			manequim_chapeus.texture = botao.textura_item
		"pescoço":
			manequim_pescoço.texture = botao.textura_item
		"sapato":
			manequim_sapato.texture = botao.textura_item
		"roupa":
			manequim_roupas.texture = botao.textura_item

	# 2. LÓGICA DO BOTÃO (O Cérebro da Loja)
	if botao.id_item in Global.itens_desbloqueados:
		# Se já comprei, verifico: Já estou usando ISSO agora?
		var item_atual_no_global = Global.acessorios[botao.tipo]
		
		if str(item_atual_no_global) == botao.id_item:
			# Se já estou usando, o botão serve para remover
			botao_acao.text = "REMOVER"
			botao_acao.disabled = false
		else:
			# Se tenho o item mas não estou usando, serve para equipar
			botao_acao.text = "EQUIPAR"
			botao_acao.disabled = false
			
		botao.texto_preço.visible = false 
		
	else:
		# Se não tenho, o botão serve para comprar... SE tiver dinheiro!
		if Global.moedas >= botao.preco:
			botao_acao.text = "COMPRAR " + str(botao.preco)
			botao_acao.disabled = false 
		else:
			# Feedback visual no próprio botão
			botao_acao.text = "FALTA DINHEIRO" # Ou "SALDO INSUFICIENTE"
			botao_acao.disabled = true 

# --- QUANDO CLICAS NO BOTÃO GRANDE (COMPRAR / EQUIPAR / REMOVER) ---
func _on_botao_acao_pressed():
	if item_selecionado == null:
		return

	# CENÁRIO A: JÁ É MEU (Pode ser Equipar ou Remover)
	if item_selecionado.id_item in Global.itens_desbloqueados:
		
		if botao_acao.text == "REMOVER":
			# -- AÇÃO DE REMOVER --
			# 1. Atualiza o Global para vazio (-1)
			Global.acessorios[item_selecionado.tipo] = -1
			Global.salvar_jogo()
			
			# 2. Limpa o visual do manequim
			limpar_manequim_visual(item_selecionado.tipo)
			
			print("Item removido!")
			
			# 3. RESET TOTAL (O que tu pediste)
			item_selecionado = null # Esquece o item
			botao_acao.visible = false # Esconde o botão
			
		else:
			# -- AÇÃO DE EQUIPAR --
			Global.acessorios[item_selecionado.tipo] = item_selecionado.id_item
			Global.salvar_jogo()
			print("Item equipado!")
			botao_acao.text = "REMOVER" # Botão vira Remover agora

	# CENÁRIO B: NÃO É MEU (Comprar)
	else:
		if Global.moedas >= item_selecionado.preco:
			# Desconta grana e salva
			sfx_compra.play()
			Global.moedas -= item_selecionado.preco
			Global.itens_desbloqueados.append(item_selecionado.id_item)
			Global.salvar_jogo()
			atualizar_moedas_visual()
			_on_item_clicado(item_selecionado)
			
		else:
			# Essa parte teoricamente não acontece pois o botão estaria disabled,
			# mas mantemos por segurança.
			sfx_sair.play()
			print("Sem dinheiro!")

func _on_fechar_pressed() -> void:
	sfx_sair.play()
	await sfx_sair.finished
	get_tree().change_scene_to_file("res://Scenes/casa.tscn")

# --- FUNÇÃO AUXILIAR PARA LIMPAR O VISUAL ---
func limpar_manequim_visual(tipo):
	match tipo:
		"oculos": manequim_oculos.texture = null
		"chapeu": manequim_chapeus.texture = null
		"pescoço": manequim_pescoço.texture = null
		"sapato": manequim_sapato.texture = null
		"roupa": manequim_roupas.texture = null

# Apaga tudo que tá no manequim naquele momento
func limpar_tudo():
	manequim_oculos.texture = null
	manequim_chapeus.texture = null
	manequim_pescoço.texture = null
	manequim_sapato.texture = null
	manequim_roupas.texture = null
