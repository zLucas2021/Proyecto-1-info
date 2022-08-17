extends StaticBody2D



func _on_detector_personaje_body_entered(_body):
	$detector_personaje/CollisionShape2D.set_deferred('disabled',true)
	$AnimationPlayer.play("caer")
	
func deshabilitar_colicionador():
	
	$colisionador.set_deferred('disabled',true)
