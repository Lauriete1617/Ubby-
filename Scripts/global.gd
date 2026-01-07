extends Node

# --- INVENTÁRIO VISUAL ---
# Aqui guarda o ID do item que está em cada parte do corpo.
# Usar -1 para dizer que o slot está "vazio".
var acessorios = {
	"oculos": -1,
	"chapeu": -1,
	"roupa": -1,
	"sapatos": -1,
	"pescoço": -1
}

# --- ESTADOS ---
var fome = 100
var sono = 100
var felicidade = 100

func _ready():
	# Assim que o jogo abre, tenta carregar os dados
	carregar_jogo()

func carregar_jogo():
	# 1. Verifica se o arquivo existe antes de tentar ler
	if not FileAccess.file_exists("user://savegame.save"):
		return # Se não existe, não faz nada (usa os valores padrão)

	# 2. Abre o arquivo para LEITURA
	var file = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	# 3. Pega os dados guardados
	var dados_salvos = file.get_var()
	
	# 4. Atualiza as nossas variáveis com o que estava no arquivo
	if dados_salvos:
		acessorios = dados_salvos["acessorios"]
		fome = dados_salvos["fome"]
		sono = dados_salvos["sono"]
		felicidade = dados_salvos["felicidade"]
		print("Jogo carregado com sucesso!")

func salvar_jogo():
	var file = FileAccess.open("user://savegame.save", FileAccess.WRITE)	
	# Criamos o dicionário DIRETAMENTE dentro dos parênteses da função
	file.store_var({
		"acessorios": acessorios,
		"fome": fome,
		"sono": sono,
		"felicidade": felicidade
	})
	print("Jogo salvo com sucesso!") # Uma mensagem para sabermos que funcionou
