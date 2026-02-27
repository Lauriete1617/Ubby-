extends Node

# --- CONFIGURAÇÕES ---
var vol_sfx: float = 1.0
var vol_musica: float = 1.0
var fullscreen: bool = true
var last_login_time = 0
# Arquivo separado para guardar as configurações
var config_path = "user://settings.cfg"

# --- VISUAL ATUAL---
var acessorios = {
	"oculos": -1,
	"chapeu": -1,
	"roupa": -1,
	"sapato": -1,
	"pescoço": -1
}

# --- ITENS ADQUIRIDOS ---
var moedas: int = 500 
var itens_desbloqueados: Array = []
var inventario_comidas: Dictionary = {} 
var cores_desbloqueadas: Array = []
var inventario_remedios = {
	"kit_completo": 0,
	"felicidade": 0,
	"energia": 0,
	"fome": 0
}

# --- ESTADOS ---
var fome = 100
var sono = 100
var felicidade = 100
var taxa_decaimento = 100.0/86400.0

# --- MINIJOGOS ---
var recorde_chovendo_moedas = 0

# --- OCUPAÇÕES ---
var assistindo_tv = false
var deitado = false

# --- CARDAPIO (CONSTANTE) ---
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
	"agua": {
		"nome": "Água mineral",
		"preco": 9,
		"fome": 2,
		"energia": 10,
		"felicidade": 4,
		"desc": "HIDRATE-SE!!!",
		"icon": "res://Assets/Sprites/Comidas/Água.png" 
	},
	"banana": {
		"nome": "Banana prata",
		"preco": 18,
		"fome": 12,
		"energia": 5,
		"felicidade": 3,
		"desc": "POTÁSSIO",
		"icon": "res://Assets/Sprites/Comidas/Banana.png"
	},
	"batata_frita": {
		"nome": "Batata frita",
		"preco": 18,
		"fome": 15,
		"energia": 2,
		"felicidade": 10,
		"desc": "Gordurosas e deliciosas",
		"icon": "res://Assets/Sprites/Comidas/Batata frita.png"
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
	"sorvete": {
		"nome": "Sorvete",
		"preco": 32,
		"fome": 15,
		"felicidade": 25,
		"energia": 8,
		"desc": "O clássico napolitano",
		"icon": "res://Assets/Sprites/Comidas/Sorvete.png"
	},
	"suco_laranja": {
		"nome": "Suco de laranja",
		"preco": 10,
		"fome": 6, 
		"felicidade": 8,
		"energia": 12,
		"desc": "Cheio de vitamina C e açúcar",
		"icon": "res://Assets/Sprites/Comidas/Suco de laranja.png"
	},
	"suco_uva": {
		"nome": "Suco de uva",
		"preco": 10,
		"fome": 6,
		"felicidade": 8,
		"energia": 12,
		"desc": "Suco natural pra fingir que é vinho",
		"icon": "res://Assets/Sprites/Comidas/Suco de uva 1.png"
	},
	"xis": {
		"nome": "Xis tudo",
		"preco": 45,
		"fome": 70,
		"felicidade": 35,
		"energia": -20,
		"desc": "Gigante e beeem recheado",
		"icon": "res://Assets/Sprites/Comidas/Xis1.png"
	} 
}

func _ready():
	carregar_jogo()
	carregar_config()

func _process(delta: float) -> void:
	if fome > 0:
		fome -= taxa_decaimento * delta
	else:
		fome = 0
	if sono > 0:
		sono -= taxa_decaimento * delta
	else:
		sono = 0
	if felicidade > 0:
		felicidade -= taxa_decaimento * delta
	else:
		felicidade = 0

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
		recorde_chovendo_moedas = dados_salvos["recorde_chovendo_moedas"]
		moedas = dados_salvos.get("moedas", 500) 
		itens_desbloqueados = dados_salvos.get("itens_desbloqueados", [])
		inventario_comidas = dados_salvos.get("inventario_comidas", {})
		
		if dados_salvos.has("timestamp"):
			var tempo_salvo = dados_salvos["timestamp"]
			var agora = Time.get_unix_time_from_system()
			var segundos_offline = agora - tempo_salvo
			print("Você ficou fora por " + str(segundos_offline) + " segundos")
			aplicar_decaimento_offline(segundos_offline)
		
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
		"inventario_comidas": inventario_comidas,
		"timestamp": Time.get_unix_time_from_system(),
		"recorde_chovendo_moedas": recorde_chovendo_moedas,
		"inventario_remedios": inventario_remedios
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
# --- DIMINUIR DO INVENTARIO --- 
	if inventario_comidas.has(id_item):
		inventario_comidas[id_item] -= 1
		if inventario_comidas[id_item] <= 0:
			inventario_comidas.erase(id_item)
			print(dados["nome"] + " acabou")
	salvar_jogo()

func resetar_dados():
# --- VARIAVEIS SIMPLES ---
	fome = 100
	sono = 100
	felicidade = 100
	moedas = 500
# --- DICIONARIOS ---
	inventario_comidas.clear()
	itens_desbloqueados.clear()
	cores_desbloqueadas.clear()
	acessorios = {
	"oculos": -1,
	"chapeu": -1,
	"roupa": -1,
	"sapato": -1,
	"pescoço": -1
}

func carregar_config():
	var config = ConfigFile.new()
	var erro = config.load(config_path)
	# Se o arquivo existir (erro == OK) carrega, senão vai o padrão
	if erro == OK:
		vol_musica = config.get_value("Audio", "Musica",1.0)
		vol_sfx = config.get_value("Audio", "SFX", 1.0)
		fullscreen = config.get_value("Video", "fullscreen",true)
		aplicar_audio()
		aplicar_video()

func salvar_config():
	var config = ConfigFile.new()
	# Seção de áudio nas configurações
	config.set_value("Audio","Musica", vol_musica)
	config.set_value("Audio", "SFX", vol_sfx)
	# Seção de vídeo nas configurações
	config.set_value("Video","fullscreen",fullscreen)
	# Salvar as configurações no disco
	config.save(config_path)

func aplicar_audio():
	var bus_sfx = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_volume_db(bus_sfx,linear_to_db(vol_sfx))
	var bus_musica = AudioServer.get_bus_index("Música")
	AudioServer.set_bus_volume_db(bus_musica,linear_to_db(vol_musica))

func aplicar_video():
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func aplicar_decaimento_offline(segundos):
	var tempo_total_para_zerar = 86400.0
	var pontos_perdidos = (segundos / tempo_total_para_zerar)*100
	fome -= pontos_perdidos
	sono -= pontos_perdidos
	felicidade -= pontos_perdidos
	fome = clamp(fome, 0, 100)
	sono = clamp(sono, 0 ,100)
	felicidade = clamp(felicidade, 0 ,100)
