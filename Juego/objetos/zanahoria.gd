extends Area2D
signal consumida()


func _on__body_entered(_body):
	Player.restar_llaves()
	emit_signal("consumida")
	$colisionador.set_deferred('disabled',true)
	$AnimationPlayer.play("consumir")
