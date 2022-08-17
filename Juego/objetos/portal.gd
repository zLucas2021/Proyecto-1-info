extends Area2D

var esta_activa=false
export var  porximo_nivel=''


func _on_portal_body_entered(body):
	if esta_activa:
		
		body.play_entrar_portal(global_position)
		yield(get_tree().create_timer(1.0),"timeout")
		cambiar_nivel()
func cambiar_nivel():
# warning-ignore:return_value_discarded
	get_tree().change_scene(porximo_nivel)
func play_animacion():
	esta_activa=true
	$AnimatedSprite.play("default")
	$AnimationPlayer2.play("activado")
