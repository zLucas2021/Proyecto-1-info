extends StaticBody2D
onready var animcaion=$AnimationPlayer
onready var salto=$salto

func _ready():
	animcaion.play("idle")


func _on_detec_impulso_body_entered(body):
	salto.play()
	animcaion.play("impulso")
	body.impulsar()

