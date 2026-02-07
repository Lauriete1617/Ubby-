extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $Visual/Corpo
@onready var particulas_carinho: CPUParticles2D = $Partículas/ParticulasCarinho
@onready var particulas_estrelas: CPUParticles2D = $Partículas/ParticulasEstrelas

# --- EFEITOS SONOROS ---
@onready var sfx_carinho: AudioStreamPlayer2D = $"Sons/SFX Carinho"

# --- REFERÊNCIAS VISUAIS (SLOTS) ---
@onready var slot_oculos: Sprite2D = $Visual/Acessórios/SlotOculos
@onready var slot_chapeu: Sprite2D = $Visual/Acessórios/SlotChapeu
@onready var slot_pescoço: Sprite2D = $Visual/Acessórios/SlotPescoço
@onready var slot_sapato: Sprite2D = $Visual/Acessórios/SlotSapato
@onready var slot_roupa: Sprite2D = $Visual/Acessórios/SlotRoupa

# --- CORES DE PELOS ---
var cores_pelo = {
	"padrao": "fffeff",
	"dourado": "fffeac",
	"roxo": "fc8aff",
	"vermelho": "fc887b",
	"verde": "a9ff9b",
	"azul": "68feff",
	"rosa": "ff8ac8",
	"marrom": "e98566"
}

# --- CATÁLOGOS ---
var catalogo_oculos = {
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
	"oculos_meme": preload("res://Assets/Sprites/Acessórios/Óculos meme.png")
}

var catalogo_chapeu = {
	"laço": preload("res://Assets/Sprites/Acessórios/Laço.png"),
	"chapeu_palha": preload("res://Assets/Sprites/Acessórios/Chapéu de palha.png"),
	"chapeu_pirata": preload("res://Assets/Sprites/Acessórios/Chapéu pirata.png"),
	"boné": preload("res://Assets/Sprites/Acessórios/Boné.png"),
	"flor": preload("res://Assets/Sprites/Acessórios/Flor.png"),
	"coroa": preload("res://Assets/Sprites/Acessórios/Coroa.png"),
	"natal": preload("res://Assets/Sprites/Acessórios/Gorro de natal.png"),
	"fone": preload("res://Assets/Sprites/Acessórios/Fone.png"),
	"brincos": preload("res://Assets/Sprites/Acessórios/Brincos.png"),
	"tiara": preload("res://Assets/Sprites/Acessórios/Tiara.png"),
	"touca_cetim": preload("res://Assets/Sprites/Acessórios/Touca de cetim.png"),
	"cartola": preload("res://Assets/Sprites/Acessórios/Cartola.png"),
	"cesto_cabeça": preload("res://Assets/Sprites/Acessórios/Cesto na cabeça.png")
}

var catalogo_pescoço = {
	"medalha": preload("res://Assets/Sprites/Acessórios/Medalha.png"),
	"colar": preload("res://Assets/Sprites/Acessórios/Colar.png"),
	"cachecol": preload("res://Assets/Sprites/Acessórios/Cachecol.png"),
	"colar_flores": preload("res://Assets/Sprites/Acessórios/Colar de flores.png"),
	"cordao_girassol": preload("res://Assets/Sprites/Acessórios/Cordão de girassol.png"),
	"babador": preload("res://Assets/Sprites/Acessórios/Babador.png"),
	"fone_pescoço": preload("res://Assets/Sprites/Acessórios/Fone no pescoço.png"),
	"colar_perolas": preload("res://Assets/Sprites/Acessórios/Colar de pérolas.png"),
	"gravata": preload("res://Assets/Sprites/Acessórios/Gravata.png"),
	"gravata_borboleta": preload("res://Assets/Sprites/Acessórios/gravata_borboleta.png"),
	"camera": preload("res://Assets/Sprites/Acessórios/Câmera.png"),
	"bandana": preload("res://Assets/Sprites/Acessórios/Bandana.png")
}

var catalogo_roupa = {
	"avental_cozinha": preload("res://Assets/Sprites/Acessórios/Avental de cozinha.png"),
	"vestido_princesa": preload("res://Assets/Sprites/Acessórios/Vestido princesa.png"),
	"roupa_rei": preload("res://Assets/Sprites/Acessórios/Roupa de rei.png"),
	"roupa_pirata1": preload("res://Assets/Sprites/Acessórios/Roupa pirata1.png"),
	"roupa_pirata2": preload("res://Assets/Sprites/Acessórios/Roupa pirata2.png"),
	"pijama": preload("res://Assets/Sprites/Acessórios/Pijama.png"),
	"roupa_estampada": preload("res://Assets/Sprites/Acessórios/Roupa estampada.png"),
	"moletom": preload("res://Assets/Sprites/Acessórios/Moletom.png"),
	"jardineira": preload("res://Assets/Sprites/Acessórios/Jardineira.png"),
	"basquete": preload("res://Assets/Sprites/Acessórios/Roupa basquete.png"),
	"roupa_basica": preload("res://Assets/Sprites/Acessórios/Roupa básica.png"),
	"terno": preload("res://Assets/Sprites/Acessórios/Terno.png")
}

var catalogo_sapato = {
	"sapato_branco": preload("res://Assets/Sprites/Acessórios/Sapato branco.png"),
	"sapato_preto": preload("res://Assets/Sprites/Acessórios/Sapato preto.png"),
	"sapato_vermelho": preload("res://Assets/Sprites/Acessórios/Sapatato vermelho.png"),
	"sapato_laranja": preload("res://Assets/Sprites/Acessórios/Sapato laranja.png"),
	"sapato_amarelo": preload("res://Assets/Sprites/Acessórios/Sapato amarelo.png"),
	"sapato_verde": preload("res://Assets/Sprites/Acessórios/Sapato verde.png"),
	"sapato_azul": preload("res://Assets/Sprites/Acessórios/Sapato azul.png"),
	"sapato_azul_marinho": preload("res://Assets/Sprites/Acessórios/Sapato azul marinho.png"),
	"sapato_roxo": preload("res://Assets/Sprites/Acessórios/Sapato roxo.png"),
	"sapato_rosa": preload("res://Assets/Sprites/Acessórios/Sapato rosa.png")
}

func _ready() -> void:
	atualizar_visual()
	animation.play("Oi")
	await animation.animation_finished
	animation.play("Idle")

func atualizar_visual():
	# 1. Óculos
	atualizar_slot_individual(slot_oculos, Global.acessorios["oculos"], catalogo_oculos)
	# 2. Chapéu
	atualizar_slot_individual(slot_chapeu, Global.acessorios["chapeu"], catalogo_chapeu)
	# 3. Pescoço
	atualizar_slot_individual(slot_pescoço, Global.acessorios["pescoço"], catalogo_pescoço)
	# 4. Roupa
	atualizar_slot_individual(slot_roupa, Global.acessorios["roupa"], catalogo_roupa)
	# 5. Sapatos
	atualizar_slot_individual(slot_sapato, Global.acessorios["sapato"], catalogo_sapato)
	# 6. Cor do pêlo
	

func atualizar_slot_individual(sprite_slot, id_item, catalogo):
	var id_str = str(id_item)
	if id_str == "-1" or id_str == "" or id_str == "null":
		sprite_slot.visible = false
		sprite_slot.texture = null
	# 2. Verifica se o item existe no catálogo específico
	elif id_item in catalogo:
		sprite_slot.visible = true
		sprite_slot.texture = catalogo[id_item]
		print("Equipado: ", id_item)
	# 3. Se deu erro (tá no Global mas não no catálogo)
	else:
		print("Erro visual: Item '", id_item, "' não encontrado neste catálogo.")
		sprite_slot.visible = false

# --- INTERAÇÃO DE CARINHO---
var na_sala = true
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if na_sala:
			dar_carinho()
		else:
			return

func dar_carinho():
	sfx_carinho.play()
	particulas_carinho.emitting = true
	animation.play("Carinho")
	await animation.animation_finished
	animation.play("Idle")
	Global.felicidade += 2

# --- MOVIMENTAÇÃO MINIGAME ---
var jogando = false
const VELOCIDADE = 300.0

func _physics_process(delta: float) -> void:
	if not jogando:
		return
	var direcao = 0.0
	var input_teclado = Input.get_axis("Esquerda", "Direita")
	if input_teclado != 0:
		direcao = input_teclado
	# 2. MOUSE
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var mouse_x = get_global_mouse_position().x 
		var distancia = mouse_x - global_position.x
		if abs(distancia) > 10:
			direcao = sign(distancia)
	# 3. APLICAR MOVIMENTO
	if direcao:
		velocity.x = direcao * VELOCIDADE
		animation.play("Andando")
		# Flip horizontal
		if direcao < 0:
			$Visual.scale.x = -1
		else:
			$Visual.scale.x = 1
	else:
		velocity.x = move_toward(velocity.x, 0, VELOCIDADE)
		animation.play("Idle")
	move_and_slide()
	# 4. LIMITE DA TELA
	global_position.x = clamp(global_position.x, 20, 296)
