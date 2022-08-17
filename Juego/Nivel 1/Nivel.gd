extends Node
export var game_over='res://Juego/menu/menu_game_over.tscn'
export var nivel_actual=''
var nume_llaves=0
var conten_llaves
func _ready():
# warning-ignore:return_value_discarded
	Player.connect("game_over",self,'game_over')
	conten_llaves=get_node_or_null('zanahorias')
	if conten_llaves!= null:
		numero_llaves_nivel()
		
func numero_llaves_nivel():
	nume_llaves=conten_llaves.get_child_count()
	Player.contabilizar_llaves(nume_llaves)
	for llave in conten_llaves.get_children():
		llave.connect('consumida',self,'llaves_restantes')
	
func llaves_restantes():
	nume_llaves-=1
	if nume_llaves==0:
		var por=get_node_or_null('portal')
		por.play_animacion()

func game_over():
	Player.nivel_actual=nivel_actual

	get_tree().change_scene(game_over)
