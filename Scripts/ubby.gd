extends CharacterBody2D

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var particulas_carinho: CPUParticles2D = $Partículas/ParticulasCarinho
@onready var particulas_estrelas: CPUParticles2D = $Partículas/ParticulasEstrelas

# O nó que vai mostrar a imagem dos óculos
@onready var slot_oculos: Sprite2D = $AnimationPlayer/Visual/Acessórios/SlotOculos

# --- O CATÁLOGO (AQUI QUE A MÁGICA ACONTECE) ---
# Dicionário que liga o "Nome do ID" ao "Arquivo de Imagem"
var catalogo_texturas = {
	# "ID_QUE_TU_USA_NA_LOJA": preload("CAMINHO_DA_IMAGEM")
	#ÓCULOS
	"oculos_roxo": preload("res://Assets/Sprites/Acessórios/Óculos roxo.png"), 
	"oculos_de_grau": preload("res://Assets/Sprites/Acessórios/Óculos de grau.png"),
	"tapa_olho": preload("res://Assets/Sprites/Acessórios/Tapa olho.png"),
	"monoculo": preload("res://Assets/Sprites/Acessórios/Monóculo.png"),
	"oculos_coraçao": preload("res://Assets/Sprites/Acessórios/Óculos de coração.png"),
	"oculos_laranja": preload("res://Assets/Sprites/Acessórios/Óculos laranja.png"),
	"oculos_nerd": preload("res://Assets/Sprites/Acessórios/Óculos nerd.png"),
	"oculos_redondo": preload("res://Assets/Sprites/Acessórios/Óculos redondo.png"),
	"mascara_dormir": preload("res://Assets/Sprites/Acessórios/Máscara de dormir.png"),
	"oculos_de_sol": preload("res://Assets/Sprites/Acessórios/Óculos de madame.png"),
	"oculos_vermelho": preload("res://Assets/Sprites/Acessórios/Óculos vermelho.png"),
	#CHAPÉUS
	"laço": preload("res://Assets/Sprites/Ícones/Laço.png"),
	"chapeu_palha": preload("res://Assets/Sprites/Acessórios/Chapéu de palha.png"),
	"chapeu_pirata": preload("res://Assets/Sprites/Acessórios/Chapéu pirata.png"),
	"boné": preload("res://Assets/Sprites/Acessórios/Boné.png"),
	# PESCOÇO
	"medalha": preload("res://Assets/Sprites/Acessórios/Medalha.png"),
	#ROUPAS
	"avental_cozinha": preload("res://Assets/Sprites/Acessórios/Avental de cozinha.png"),
	#SAPATOS
	"sapato_branco": preload("res://Assets/Sprites/Acessórios/Sapato branco.png"),
}

func _ready() -> void:
	atualizar_visual()
	
	# Começa a animação de respirar
	animation.play("Idle")

func atualizar_visual():
	# 1. Pergunta ao Global: "Qual o nome do óculos que estou usando?"
	var id_salvo = Global.acessorios["oculos"]
	
	# 2. Verifica se não tem nada equipado (pode ser -1, nulo ou string vazia)
	if str(id_salvo) == "-1" or id_salvo == "" or id_salvo == null:
		slot_oculos.visible = false
		print("Ubby sem óculos.")
	
	# 3. Se tiver algo, procura no catálogo
	elif id_salvo in catalogo_texturas:
		slot_oculos.visible = true
		slot_oculos.texture = catalogo_texturas[id_salvo] # Carrega a imagem!
		print("Ubby vestiu: ", id_salvo)
		
	# 4. Segurança: Se o ID existir no Global mas não no Catálogo (ex: erro de digitação)
	else:
		print("ERRO: O item '", id_salvo, "' está salvo, mas não achei a imagem no catálogo!")
		slot_oculos.visible = false

# --- INTERAÇÃO (CARINHO) ---
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		dar_carinho()

func dar_carinho():
	particulas_carinho.emitting = true
	animation.play("Carinho")
	await animation.animation_finished
	animation.play("Idle")
