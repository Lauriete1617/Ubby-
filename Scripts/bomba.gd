extends Area2D

var velocidade_queda = 180
var explodiu = false

func _process(delta: float) -> void:
	if explodiu:
		return
	position.y += velocidade_queda * delta
	if position.y > 175:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if explodiu:
		return
	if get_parent().has_method("coletar_item"):
		get_parent().coletar_item("bomba")
	queue_free()
