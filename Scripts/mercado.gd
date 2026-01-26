extends Control

# Onde vão os botões
@onready var grid_container: GridContainer = $HBoxContainer/ScrollContainer/GridContainer

# --- VITRINE (Painel Esquerdo) ---
@onready var informacoes: VBoxContainer = $"HBoxContainer/painel de informacoes/MarginContainer/Informacoes"
@onready var label_bem_vindo: Label = $"HBoxContainer/painel de informacoes/Label_bem_vindo"
@onready var label_nome: Label = $"HBoxContainer/painel de informacoes/MarginContainer/Informacoes/Label_nome"
@onready var imagem_comida: TextureRect = $"HBoxContainer/painel de informacoes/MarginContainer/Informacoes/imagem_comida"
@onready var label_preco: Label = $"HBoxContainer/painel de informacoes/MarginContainer/Informacoes/Label_preco"
@onready var label_fome: Label = $"HBoxContainer/painel de informacoes/MarginContainer/Informacoes/Label_fome"
@onready var label_felicidade: Label = $"HBoxContainer/painel de informacoes/MarginContainer/Informacoes/Label_felicidade"
@onready var label_bonus: Label = $"HBoxContainer/painel de informacoes/MarginContainer/Informacoes/Label_bonus"
@onready var label_descricao: Label = $"HBoxContainer/painel de informacoes/MarginContainer/Informacoes/Label_descricao"
@onready var text_moedas: Label = $"HBoxContainer/painel de informacoes/text moedas"
# --- BOTÕES DE AÇÃO ---
@onready var botao_acao: Button = $"HBoxContainer/painel de informacoes/MarginContainer/Informacoes/botao_acao"
@onready var fechar: Button = $"HBoxContainer/painel de informacoes/Fechar"
# --- CENA PARA INSTANCIAR ---
@export var item_loja: PackedScene
# --- SONS ---
@onready var sfx_botão: AudioStreamPlayer2D = $"Sons/SFX Botão"
@onready var sfx_compra: AudioStreamPlayer2D = $"Sons/SFX Compra"
@onready var sfx_sair: AudioStreamPlayer2D = $"Sons/SFX Sair"
# --- VARIÁVEIS ---
var item_selecionado = ""

func _ready() -> void:
	informacoes.visible = false
	label_bem_vindo.visible = true
	atualizar_moedas_visual()
	# Limpa a lista antiga (caso tenha botões de teste)
	for filho in grid_container.get_children():
		filho.queue_free()
		
	# Cria os novos botões baseados no Global
	for id in Global.CARDAPIO:
		var dados = Global.CARDAPIO[id]
		var novo_botao = item_loja.instantiate()
		
		# Preenche os dados do botão
		novo_botao.id_item = id
		novo_botao.preco = dados["preco"]
		novo_botao.tipo = "comida"
		novo_botao.textura_item = load(dados["icon"])
		
		# Adiciona na tela
		grid_container.add_child(novo_botao)
		
		# Conecta o clique (IMPORTANTE: usando .bind para passar o ID)
		novo_botao.pressed.connect(_on_item_clicado.bind(id))

# Chamada quando clica num item da lista
func _on_item_clicado(id_recebido: String):
	print("Item clicado: " + id_recebido)
	sfx_botão.play()
	informacoes.visible = true
	label_bem_vindo.visible = false
	item_selecionado = id_recebido
	
	var dados = Global.CARDAPIO[id_recebido]
	
	# --- ATUALIZAR OS TEXTOS DA VITRINE --- 
	label_nome.text = dados["nome"]
	label_descricao.text = dados["desc"]
	
	# Usamos str() para converter números em texto
	label_preco.text = "Preço: 🪙 " + str(dados["preco"])
	imagem_comida.texture = load(dados["icon"])
	label_fome.text = "Sacia: 🍖 " + str(dados["fome"])
	
	# --- LÓGICA DO BÔNUS (Energia/Sono) --- 
	if dados["energia"] > 0:
		label_bonus.text = "Energia: ⚡ +" + str(dados["energia"])
	elif dados["energia"] < 0:
		label_bonus.text = "Sono: 💤 " + str(dados["energia"])
	else:
		label_bonus.text = "Sem efeitos extras"
		
	# --- LÓGICA FELICIDADE ---
	if dados["felicidade"] > 0:
		label_felicidade.text = "Felicidade: ✨ " + str(dados["felicidade"])
		label_felicidade.visible = true
	else:
		label_felicidade.visible = false
	
	# --- ATUALIZA O BOTÃO DE COMPRAR IMEDIATAMENTE ---
	# Assim o jogador já sabe se pode comprar antes de clicar
	if Global.moedas >= dados["preco"]:
		botao_acao.text = "COMPRAR"
		botao_acao.disabled = false # Destrava o botão
	else:
		botao_acao.text = "FALTA DINHEIRO"
		botao_acao.disabled = true # Trava o botão (fica cinza)

# Chamada quando clica em COMPRAR
func _on_botao_acao_pressed() -> void:
	# 1. Segurança: Se não tem nada selecionado, cancela
	if item_selecionado == "":
		print("Selecione sua compra primeiro")
		return

	var dados = Global.CARDAPIO[item_selecionado]
	var preco = dados["preco"]
	
	# 2. Verifica o dinheiro
	if Global.moedas >= preco:
		# Paga
		Global.moedas -= preco
		sfx_compra.play()
		atualizar_moedas_visual()
		
		# Adiciona no inventário
		if Global.inventario_comidas.has(item_selecionado):
			Global.inventario_comidas[item_selecionado] += 1
		else:
			Global.inventario_comidas[item_selecionado] = 1
		
		print("Comprou! Agora você tem: " + str(Global.inventario_comidas[item_selecionado]))
		
		# Salva o jogo para garantir
		Global.salvar_jogo()
		
		# Verifica se ainda tem dinheiro para comprar outro do mesmo
		if Global.moedas < preco:
			botao_acao.text = "FALTA DINHEIRO"
			botao_acao.disabled = true
	else:
		# Isso aqui só acontece se algo muito estranho ocorrer
		print("Dinheiro insuficiente!")

func atualizar_moedas_visual():
	text_moedas.text = "🪙 " + str(Global.moedas)

func _on_fechar_pressed() -> void:
	print("Terminando as compras...")
	sfx_sair.play()
	await sfx_sair.finished
	get_tree().change_scene_to_file("res://Scenes/casa.tscn")
