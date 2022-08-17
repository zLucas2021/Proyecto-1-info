extends Node2D
onready var detector_jug=$Sprite/RayCast2D
onready var posic_disparo=$Sprite/posicionesDisparo
onready var cad_dispa=$Timer
export var rayo:PackedScene
onready var son_rayo=$rayos
var puede_disparar=true
func _process(_delta):
	if detector_jug.is_colliding() and puede_disparar:
		dispara()
		puede_disparar=false
		cad_dispa.start()
	
func dispara():
	son_rayo.play()
	for posicion in posic_disparo.get_children():
		var nuevo_rayo=rayo.instance()
		nuevo_rayo.crear(posicion.global_position)
		add_child(nuevo_rayo)


func _on_Timer_timeout():
	puede_disparar=true
