extends Button

@export var id_item: String = ""
@export var preco: int = 100
@export var textura_item: Texture 
@export var tipo: String = "oculos"

@onready var texto_preço: Label = $Preço

func _ready():
	if textura_item:
		icon = textura_item
		expand_icon = true
		icon_alignment = HORIZONTAL_ALIGNMENT_CENTER 
		vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP 
	texto_preço.text = str(preco)

func _on_pressed() -> void:
	print("Selecionei " + id_item)
