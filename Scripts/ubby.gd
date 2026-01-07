extends CharacterBody2D

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var particulas_carinho: CPUParticles2D = $Partículas/ParticulasCarinho
@onready var slot_oculos: Sprite2D = $AnimationPlayer/Visual/Acessórios/SlotOculos
@onready var particulas_estrelas: CPUParticles2D = $Partículas/ParticulasEstrelas

func _ready() -> void:# 
	#Pergunta ao Global: "Qual óculos eu devo usar?"
	var id_salvo = Global.acessorios["oculos"]
	if id_salvo == -1:
		slot_oculos.visible = false
	else:
		slot_oculos.visible = true
		slot_oculos.frame = id_salvo
	#Já começar com a animação dele respirando
	animation.play("Idle")

func _input_event(viewport, event, shape_idx):
	#Verificar se recebeu um clique do botão esquerdo do mouse no pet
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		print("Clique esquerdo detectado!")
		dar_carinho()
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT:
		print("Clique direito detectado!")
		testar_troca_de_oculos()

func dar_carinho():
	print("CARINHOOO")
	#Partículas de carinho
	particulas_carinho.emitting = true
	#Toca a animação de carinho
	animation.play("Carinho")
	#Espera acabar antes de voltar ao normal
	await animation.animation_finished
	animation.play("Idle")

func testar_troca_de_oculos():
	# 1. Se estiver INVISÍVEL, coloca o primeiro óculos
	if slot_oculos.visible == false:
		slot_oculos.visible = true
		slot_oculos.frame = 0
		# Avise o Global: "Estou usando o óculos 0!"
		Global.acessorios["oculos"] = 0
		print("Colocou Óculos 0")
		
	# 2. Se já estiver com o óculos 0, troca para o 1
	elif slot_oculos.frame == 0:
		slot_oculos.frame = 1
		# Avise o Global: "Agora é o óculos 1!"
		Global.acessorios["oculos"] = 1
		print("Trocou para Óculos 1")
		
	# 3. Se não for nenhum dos anteriores, tira tudo
	else:
		slot_oculos.visible = false
		# Avise o Global: "Estou sem nada (-1)!"
		Global.acessorios["oculos"] = -1
		print("Tirou os óculos")
	Global.salvar_jogo()
	particulas_estrelas.emitting = true
