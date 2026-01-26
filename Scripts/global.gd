extends Node

# --- VISUAL ATUAL---
var acessorios = {
	"oculos": -1,
	"chapeu": -1,
	"roupa": -1,
	"sapato": -1,
	"pescoço": -1
}

# --- ITENS ADQUIRIDOS ---
var moedas: int = 1000 
var itens_desbloqueados: Array = []

# --- NOVO: INVENTÁRIO DE COMIDAS ---
# Guarda o que o Ubby TEM na mochila. Ex: {"coxinha": 2, "cafe": 5}
var inventario_comidas: Dictionary = {} 

# --- ESTADOS ---
var fome = 100
var sono = 100
var felicidade = 100

# --- CARDAPIO (CONSTANTE) ---
# Corrigido: Usando ':' em vez de '=' e padronizado "preco"
const CARDAPIO = {
	"acai": {
		"nome": "Açaí completo",
		"preco": 25,
		"fome": 15,
		"energia": 15,
		"felicidade": 15,
		"desc": "Energia em uma tigela",
		"icon": "res://Assets/Sprites/Comidas/Açaí1.png"
	},
	"brigadeiro": {
		"nome": "Brigadeiro",
		"preco": 5,
		"fome": 5,
		"energia": 5,
		"felicidade": 30,
		"desc": "Felicidade instantânea",
		"icon": "res://Assets/Sprites/Comidas/Brigadeiro1.png"
	},
	"cafe": {
		"nome": "Cafézinho",
		"preco": 10,
		"fome": 10,
		"energia": 20,
		"felicidade": 5,
		"desc": "Essencial pra comecar o dia",
		"icon": "res://Assets/Sprites/Comidas/Café1.png"
	},
	"chimarrao": {
		"nome": "Chimarrão",
		"preco": 15,
		"fome": 5,
		"energia": 10,
		"felicidade": 15,
		"desc": "Amargo, quente e tradicional",
		"icon": "res://Assets/Sprites/Comidas/Chimarrão1.png"
	},
	"churrasco": {
		"nome": "Churrasco",
		"preco": 80,
		"fome": 90,
		"energia": -30,
		"felicidade": 50,
		"desc": "A elite da comida gaúcha",
		"icon": "res://Assets/Sprites/Comidas/Churrasco1.png"
	},
	"cha": {
		"nome": "Chá de camomila",
		"preco": 5,
		"fome": 2,
		"energia": -20,
		"felicidade": 10,
		"desc": "Calmante natural para ursos",
		"icon": "res://Assets/Sprites/Comidas/Chá de camomila1.png"
	},
	"coxinha": {
		"nome": "Coxinha",
		"preco": 18,
		"fome": 25,
		"felicidade": 10,
		"energia": 0,
		"desc": "A rainha dos salgados brasileiros",
		"icon": "res://Assets/Sprites/Comidas/Coxinha1.png"
	},
	"guarana": {
		"nome": "Guaraná",
		"preco": 12,
		"fome": 5,
		"felicidade": 20,
		"energia": 10,
		'desc': "O sabor do Brasil geladinho",
		"icon": "res://Assets/Sprites/Comidas/Guaraná.png"
	},
	"la_minuta": {
		"nome": "La minuta",
		"preco": 40,
		"fome": 60,
		"felicidade": 15,
		"energia": -10,
		"desc": "Arroz, feijão, carne, ovo e batata frita",
		"icon": "res://Assets/Sprites/Comidas/La minuta1.png"
	},
	"massa": {
		"nome": "Macarrão",
		"preco": 35,
		"fome": 50,
		"felicidade": 10,
		"energia": -5,
		"desc": "Aquele almoço de domingo",
		"icon": "res://Assets/Sprites/Comidas/Massa1.png"
	},
	"pao_queijo": {
		"nome": "Pão de queijo",
		"preco": 15, # Corrigido de "preço" para "preco"
		"fome": 15,
		"felicidade": 10,
		"energia": 0,
		"desc": "Impossível comer um só",
		"icon": "res://Assets/Sprites/Comidas/Pão de queijo1.png"
	},
	"salada": {
		"nome": "Salada fit",
		"preco": 22,
		"fome": 30,
		"energia": 10,
		"felicidade": 5,
		"desc": "Pra manter a forma",
		"icon": "res://Assets/Sprites/Comidas/Salada1.png"
	},
	"salada_frutas": {
		"nome": "Salada de frutas",
		"preco": 20,
		"fome": 15,
		"felicidade": 15,
		"energia": 5,
		"desc": "Refrescante e colorida",
		"icon": "res://Assets/Sprites/Comidas/Salada de frutas1.png"
	},
	"xis": {
		"nome": "Xis tudo",
		"preco": 45,
		"fome": 70,
		"felicidade": 35,
		"energia": -20,
		"desc": "Gigante e beeem recheado",
		"icon": "res://Assets/Sprites/Comidas/Xis1.png"
	} # Removida a vírgula extra no final
}

func _ready():
	carregar_jogo()

func carregar_jogo():
	if not FileAccess.file_exists("user://savegame.save"):
		return 

	var file = FileAccess.open("user://savegame.save", FileAccess.READ)
	var dados_salvos = file.get_var()
	
	if dados_salvos:
		acessorios = dados_salvos["acessorios"]
		fome = dados_salvos["fome"]
		sono = dados_salvos["sono"]
		felicidade = dados_salvos["felicidade"]
		
		# NÃO carregamos o CARDAPIO, ele é fixo no código.
		
		moedas = dados_salvos.get("moedas", 500) 
		itens_desbloqueados = dados_salvos.get("itens_desbloqueados", [])
		
		# Carregamos o inventário de comidas (se existir, senão cria vazio)
		inventario_comidas = dados_salvos.get("inventario_comidas", {})
		
		print("Jogo carregado! Moedas: ", moedas)

func salvar_jogo():
	var file = FileAccess.open("user://savegame.save", FileAccess.WRITE)	
	
	file.store_var({
		"acessorios": acessorios,
		"fome": fome,
		"sono": sono,
		"felicidade": felicidade,
		"moedas": moedas,
		"itens_desbloqueados": itens_desbloqueados,
		"inventario_comidas": inventario_comidas # Salvamos o inventário!
		# Não salvamos o CARDAPIO aqui.
	})
	print("Jogo salvo com sucesso!")

func consumir_item(id_item: String):
	if not CARDAPIO.has(id_item):
		print("ERRO! item inexistente")
		return
	var dados = CARDAPIO[id_item]
	print("Consumindo: " + dados["nome"])
# --- ESTATÍSTICAS ---
	fome += dados["fome"]
	fome = clamp (fome, 0, 100)
	sono += dados["energia"]
	sono = clamp(sono, 0, 100)
	felicidade += dados["felicidade"]
	felicidade = clamp(felicidade, 0 ,100)
# --- DMINUIR DO INVENTARIO --- 
	if inventario_comidas.has(id_item):
		inventario_comidas[id_item] -= 1
		if inventario_comidas[id_item] <= 0:
			inventario_comidas.erase(id_item)
			print(dados["nome"] + " acabou")
	salvar_jogo()
