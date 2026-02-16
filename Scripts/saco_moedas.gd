extends Area2D

var velocidade_queda = 200
@onready var sfx: AudioStreamPlayer2D = $SFX
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _process(delta: float) -> void:
	position.y += velocidade_queda * delta
	if position.y > 175:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if get_parent().has_method("coletar_item"):
		get_parent().coletar_item("saco_moedas")
		collision_shape.set_deferred("disabled", true)
		visible = false 
		set_process(false)
		sfx.play()
		await sfx.finished
		queue_free()
