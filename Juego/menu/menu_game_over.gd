extends Control
var nivel_actual=''

func _ready():
	nivel_actual=Player.nivel_actual
	Player.reset()

func _on_boton_menu_pressed():
	get_tree().change_scene("res://Juego/menu/menu_principal.tscn")
	


func _on_reintetar_pressed():
	get_tree().change_scene(nivel_actual)
