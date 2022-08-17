extends Control

func _ready():
	$menu_game_over/puntaje.text= 'Puntaje: %s'% Player.generar_puntaje()
