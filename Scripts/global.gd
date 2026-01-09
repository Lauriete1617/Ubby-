extends Node

# --- VISUAL ATUAL---
var acessorios = {
	"oculos": -1, # Lembra que pode ser String "" ou -1, mantém padrão
	"chapeu": -1,
	"roupa": -1,
	"sapatos": -1,
	"pescoço": -1
}

# --- ITENS ADQUIRIDOS ---
var moedas: int = 500 
var itens_desbloqueados: Array = []
# --- ESTADOS ---
var fome = 100
var sono = 100
var felicidade = 100

func _ready():
	carregar_jogo()

func carregar_jogo():
	if not FileAccess.file_exists("user://savegame.save"):
		return 

	var file = FileAccess.open("user://savegame.save", FileAccess.READ)
	var dados_salvos = file.get_var()
	
	if dados_salvos:
		# Carrega os estados antigos
		acessorios = dados_salvos["acessorios"]
		fome = dados_salvos["fome"]
		sono = dados_salvos["sono"]
		felicidade = dados_salvos["felicidade"]
		
		# --- NOVO: Carrega o dinheiro e inventário ---
		# Usamos o 'get' com valor padrão, caso seja um save antigo que não tinha isso ainda
		moedas = dados_salvos.get("moedas", 500) 
		itens_desbloqueados = dados_salvos.get("itens_desbloqueados", [])
		
		print("Jogo carregado! Moedas: ", moedas)

func salvar_jogo():
	var file = FileAccess.open("user://savegame.save", FileAccess.WRITE)	
	
	# Agora salvamos TUDO
	file.store_var({
		"acessorios": acessorios,
		"fome": fome,
		"sono": sono,
		"felicidade": felicidade,
		"moedas": moedas, # <-- Adicionado
		"itens_desbloqueados": itens_desbloqueados # <-- Adicionado
	})
	print("Jogo salvo com sucesso!")
