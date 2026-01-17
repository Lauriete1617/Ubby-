extends AnimatedSprite2D

var dormindo = false
var abajur_aceso = true

@onready var ubby: CharacterBody2D = $"../../Ubby"

# DICA: Crie uma função só para decidir qual desenho mostrar.
# Isso evita que você tenha que escrever os "If/Elif" duas vezes.
func atualizar_visual():
	if dormindo:
		if abajur_aceso:
			play("Aceso (Ocupado)")
		else:
			play("Apagado (Ocupado)")
	else:
		# Se não está dormindo (cama vazia)
		if abajur_aceso:
			play("Aceso (Vazio)")
		else:
			play("Apagado (Vazio)")

func _on_abajur_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		# Inverte o estado da luz
		abajur_aceso = not abajur_aceso
		# Chama a função que decide o desenho
		atualizar_visual()

func _on_cama_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		
		# SE ESTIVER ACORDADO -> VAI DORMIR
		if not dormindo:
			dormindo = true # Já marca como dormindo para bloquear outras ações
			
			# 1. Esconde o Ubby real para não duplicar
			ubby.visible = false 
			
			# 2. Toca a animação de transição
			play("Deitando")
			await animation_finished
			
			# 3. Narrativa: Ao dormir, ele apaga a luz automaticamente?
			# Se sim, descomente a linha abaixo:
			# abajur_aceso = false 
			
			atualizar_visual()
			
		# SE ESTIVER DORMINDO -> ACORDA
		else:
			dormindo = false
			# Ubby reaparece
			ubby.visible = true
			atualizar_visual()
