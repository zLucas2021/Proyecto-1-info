extends Control

export var escena=''
func _ready():
	Player.reset()
func _on_Button_inicio_pressed():
	Musicaglobal.replay()
	get_tree().change_scene("res://Juego/Nivel 1/Nivel1.tscn")
