extends Button

@export var id_item: String = ""
@export var preco: int = 100
@export var textura_item: Texture 
@export var tipo: String = "oculos"

@onready var texto_preço: Label = $Preço

func _ready():
	# 1. Configura o ícone nativo do botão
	if textura_item:
		icon = textura_item
		expand_icon = true # Importante: faz a imagem crescer para caber no botão
		icon_alignment = HORIZONTAL_ALIGNMENT_CENTER # Centraliza
		vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP # Põe a imagem mais para cima

	# 2. Configura o preço
	texto_preço.text = "🪙 " + str(preco)

func _on_pressed() -> void:
	print("Selecionei " + id_item)
