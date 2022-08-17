extends Area2D
onready var detec_jug=$detecjug
onready var detec_piso=$detector/colisionador
onready var animacion=$AnimationPlayer
func _on_detector_body_entered(body):
	desac_coli([detec_jug,detec_piso])
	animacion.stop()
	animacion.play("morir")
	body.impulsar()
	


func _on_body_entered(body):
	body.respaw()

func desac_coli(colisionadores):
	for colision in colisionadores:
		colision.set_deferred('disabled',true)
