extends Area2D
export (String,'oro','plata','bronce') var tipo_moneda
onready var animacion=$AnimatedSprite
onready var consumir=$AnimationPlayer
onready var colision_pers=$CollisionShape2D
onready var c:=0
func _ready():
	animacion.play()

	


func _on_body_entered(_body):
	Player.suma_moneda(tipo_moneda)
	colision_pers.set_deferred('disabled',true)
	c+=1
	consumir.play("consumir")
