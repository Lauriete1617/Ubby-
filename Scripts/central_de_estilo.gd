extends Control

# Botão para fechar a central de estilo
@onready var fechar: Button = $Fechar
# Mostra quantas moedas o player tem
@onready var text_moedas: Label = $HBoxContainer/Provador/Moedas

# Variável de Controle
var item_selecionado = null 

# Botão de compra
@onready var botao_acao: Button = $HBoxContainer/Provador/botao_acao # Verifica maiúsculas/minúsculas no nome do nó!

# Referências do Manequim
@onready var manequim_oculos = $"HBoxContainer/Provador/ManequimUbby/Manequim_oculos"

@export var grades_de_itens: Array[GridContainer]

func _ready():
	# Começa escondendo o botão grande, pois ninguém foi clicado ainda
	botao_acao.visible = false
	atualizar_moedas_visual()
	
	# Conecta os botões da grade
	for grade in grades_de_itens:
		for botao in grade.get_children():
			if botao.has_signal("pressed"):
				botao.pressed.connect(_on_item_clicado.bind(botao))
				
				# MELHORIA: Esconder preço nos itens que já tenho logo de cara
				if botao.id_item in Global.itens_desbloqueados:
					# Precisamos acessar o Label dentro do botão. 
					# Como o script ItemLoja tem 'texto_preço', usamos ele:
					botao.texto_preço.visible = false

func atualizar_moedas_visual():
	text_moedas.text = "🪙 " + str(Global.moedas)

func _on_item_clicado(botao):
	print("Item selecionado: ", botao.id_item)
	item_selecionado = botao 
	
	# Faz o botão de ação aparecer
	botao_acao.visible = true
	
	# 1. Visual: Mostra no manequim
	if botao.tipo == "oculos":
		manequim_oculos.texture = botao.textura_item
	
	# 2. Lógica: Decide se é COMPRAR ou EQUIPAR
	if botao.id_item in Global.itens_desbloqueados:
		botao_acao.text = "EQUIPAR"
		botao_acao.disabled = false
		
		# Esconde o preço no item da prateleira (feedback visual)
		botao.texto_preço.visible = false
	else:
		botao_acao.text = "COMPRAR " + str(botao.preco) + " 🪙"
		
		if Global.moedas >= botao.preco:
			botao_acao.disabled = false 
		else:
			botao_acao.disabled = true 

func _on_botao_acao_pressed():
	if item_selecionado == null:
		return

	# CENÁRIO 1: EQUIPAR
	if item_selecionado.id_item in Global.itens_desbloqueados:
		Global.acessorios[item_selecionado.tipo] = item_selecionado.id_item # Cuidado com String vs Int aqui!
		Global.salvar_jogo()
		print("Item equipado!")
		
		botao_acao.text = "EQUIPADO!"
		botao_acao.disabled = true 

	# CENÁRIO 2: COMPRAR
	else:
		if Global.moedas >= item_selecionado.preco:
			Global.moedas -= item_selecionado.preco
			Global.itens_desbloqueados.append(item_selecionado.id_item)
			Global.salvar_jogo()
			
			# Atualiza o visual das moedas lá em cima
			atualizar_moedas_visual()
			
			# Atualiza o botão para "EQUIPAR"
			_on_item_clicado(item_selecionado)
			
		else:
			print("Sem dinheiro!")

func _on_fechar_pressed() -> void:
	# Troca de cena para voltar ao quarto (em vez de fechar o jogo)
	get_tree().change_scene_to_file("res://Scenes/ubby.tscn")
