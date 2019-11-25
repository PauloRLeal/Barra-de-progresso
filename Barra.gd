extends Node2D

onready var marc1 = $Sprite/Marcador
var perc1 = 0
var score1 = 100
var diff_pontos1 = 0
var perfect1 = 0


func _ready():
	randomize()
	set_process(true)
	posicao_inicial()
	
func _process(delta):
	if marc1.get_region_rect().size[0] < 182:
		perc1 += 0.1 * delta
		marc1.set_region_rect(Rect2(0, 0, perc1*188, 23))
	else:
		marc1.set_region_rect(Rect2(0, 0, 188, 23))
	print(get_sizes_update())
	
func _on_Button_pressed():
	set_process(false)
	get_sizes_update()
			
func posicao_inicial():
	var rand_index1 = int(rand_range(0,3))
	var ponto1 = $pontos.get_children()[rand_index1]
	$Sprite/quadradinho.global_position.x = ponto1.global_position.x
	$Sprite/Marcador.global_position = $Sprite.global_position + Vector2(3,0)
	perfect1 = ponto1.global_position.x
	

func get_sizes_update():
	diff_pontos1 = marc1.get_region_rect().size[0] - $Sprite/quadradinho.position.x
	
	if diff_pontos1 == 0:
		score1 = 100
	elif abs(diff_pontos1):
		var porcentagem_total = perfect1/(perfect1-(diff_pontos1))*100
		var resultado = porcentagem_total if porcentagem_total <= 100 else 100-(porcentagem_total-100)
		score1 = resultado
	
	return score1
		
	
	
	