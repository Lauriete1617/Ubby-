extends CharacterBody2D

@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	#Já começar com a animação dele respirando
	animation.play("Idle")
	
func _input_event(viewport, event, shape_idx):
	#Verificar se recebeu um clique do botão esquerdo do mouse no pet
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		print("Clique esquerdo detectado!")
		dar_carinho()
		
func dar_carinho():
	#Toca a animação de carinho
	animation.play("Carinho")
	#Espera acabar antes de voltar ao normal
	await animation.animation_finished
	animation.play("Idle")
