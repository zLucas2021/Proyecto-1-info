extends KinematicBody2D

export var velocidad =100
var gravedad=100
var movimiento=Vector2.ZERO
onready var animacion= $AnimatedSprite
onready var decvacio= $RayCast2D
onready var dectlado= $RayCast2D2
func _physics_process(_delta):
	caer()
	caminar()
# warning-ignore:return_value_discarded
	move_and_slide(movimiento,Vector2.UP)

func caer():
	if not is_on_floor():
		movimiento.y=gravedad
func caminar():
	
	if not animacion.is_playing():
		animacion.play('caminar')
	dectcolicion()
	movimiento.x=velocidad
func dectcolicion():
	if not decvacio.is_colliding() or dectlado.is_colliding():
		velocidad*=-1
		decvacio.position*=-1
		dectlado.position.x*=-1
		dectlado.scale*=-1
		animar(animacion.flip_h)


func animar(valor_actual):
	animacion.flip_h=!valor_actual

	


func _on_dectejg_body_entered(body):
	body.respaw()
