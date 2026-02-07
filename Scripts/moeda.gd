extends Area2D

var velocidade_queda = 150

func _process(delta: float) -> void:
	position.y += velocidade_queda * delta
	if position.y > 175:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if get_parent().has_method("coletar_item"):
		get_parent().coletar_item("moeda")
		queue_free()
