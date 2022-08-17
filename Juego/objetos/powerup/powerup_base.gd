extends Area2D
onready var consumir=$AnimationPlayer
onready var detec_jug=$CollisionShape2D
func _on_powerup_base_body_entered(body):
	aplic_power_up(body)
	detec_jug.set_deferred('disabled',true)
	consumir.play("consumir")
func aplic_power_up(_body):
	pass
