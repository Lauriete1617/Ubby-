extends Node2D

@onready var music_player: AudioStreamPlayer2D = $"Music Player"

var musica_atual: String = ""
var faixas = {
	"casa": preload("res://Assets/Músicas/musica casa.wav"),
	"menu": preload("res://Assets/Músicas/musica menus.wav"),
	"mercado": preload("res://Assets/Músicas/musica mercado.wav"),
	"central_estilo": preload("res://Assets/Músicas/musica central de estilo.wav"),
	"minijogo": preload("res://Assets/Músicas/musica minijogo.wav"),
	"cozinha": preload("res://Assets/Músicas/musica cozinha.wav"),
	"patio": preload("res://Assets/Músicas/musica patio.wav"),
	"hospital": preload("res://Assets/Músicas/musica hospital.wav")
}

func _ready() -> void:
	music_player.volume_db = 0

func tocar(nome_faixa: String):
	# Verificar se a música já está sendo tocada
	if musica_atual == nome_faixa and music_player.playing:
		return
	# Verificar se a música está na lista
	if not faixas.has(nome_faixa):
		print("ERRO: música não encontrada")
		return
	# Verificar se o valor na lista de faixas é nulo
	if faixas[nome_faixa] == null:
		print("Faixa vazia: " + nome_faixa)
		fade_out()
		return
	# Se já tiver outra música tocando, primeiro diminui o volume dela pra depois começar a próxima
	if music_player.playing:
		var tween_out = create_tween()
		tween_out.tween_property(music_player, "volume_db", -80.0, 0.5)
		await tween_out.finished
	# Troca o arquivo de áudio
	music_player.stream = faixas[nome_faixa]
	music_player.play()
	musica_atual = nome_faixa
	# Fade in (Aumenta o volume)
	var tween_in = create_tween()
	tween_in.tween_property(music_player, "volume_db", 0.0, 0.8)

# Função para silêncio total
func fade_out():
	if music_player.playing:
		var tween = create_tween()
		tween.tween_property(music_player, "volume_db", -80, 1)
		musica_atual = ""
		await tween.finished
		music_player.stop()
