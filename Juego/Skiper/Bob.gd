extends KinematicBody2D

	
export var velocidad = Vector2(150.0, 150.0)
export var caida_acel= 120
export var fuerz_salto=3000
export var rebote=350
export var impulso=-3800
var movimiento= Vector2.ZERO
var fuerz_salot_original
var acel_caida_original
var puede_moverse=true

onready var animacion =$anim
onready var audio_salto =$audiosalto
onready var camara=$Camera2D
onready var enfriamiento=$enfriamiento_powerup
onready var volar_enfr=$efrieamiento_volar
onready var animacion_personaje=$AnimationPlayer
func _ready():
	animacion_personaje.play("aclarar")
	fuerz_salot_original=fuerz_salto
	acel_caida_original=caida_acel
func _physics_process(_delta):
	movimiento.x = velocidad.x* elegir_direccion()
	saltar()
	caer()
	choque_techo()
	caida()
# warning-ignore:return_value_discarded
	move_and_slide(movimiento,Vector2.UP) 
func caer():
	if not is_on_floor():
		animacion.play("salto")
		movimiento.y += caida_acel
		movimiento.y=clamp(movimiento.y,-fuerz_salto,velocidad.y)
func saltar():
	if Input.is_action_just_pressed("salto") and is_on_floor() and puede_moverse:
		audio_salto.play()
		animacion.play('salto')
		movimiento.y=0
		movimiento.y -= fuerz_salto
	
func elegir_direccion():
	var direc=0
	if puede_moverse:
		direc =Input.get_action_strength("moverdere")-Input.get_action_strength("moverizquier")
		if direc == 0:
			animacion.play('quieto')
		else:
			if direc <0:
				animacion.flip_h= true
			else:
				animacion.flip_h=false
			animacion.play('correr')
	return(direc)
func choque_techo():
	if is_on_ceiling():
		movimiento.y = rebote
func impulsar():
	movimiento.y=impulso
	
func cambiar_fuerza_salto():
	enfriamiento.start()
	fuerz_salto=-impulso*0.9
	
func volar():
	volar_enfr.start()
	caida_acel=100
	animacion_personaje.play("volar")
	movimiento.y=0
	movimiento.y -= fuerz_salto
func respaw():
	Player.restar_vidas()
	animacion_personaje.play("oscurecer")
	if Player.vidas!=0:
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
	
func caida():
	if position.y >camara.limit_bottom:
		respaw()


func _on_enfriamiento_powerup_timeout():
	fuerz_salto=fuerz_salot_original


func _on_efrieamiento_volar_timeout():
	animacion_personaje.play("defalut")
	caida_acel=acel_caida_original

# warning-ignore:unused_argument
func play_entrar_portal(porximo_nivel):
	puede_moverse=false
	$AnimationPlayer.play("entrar")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=='entrar':
		animacion_personaje.play("oscurecer")
