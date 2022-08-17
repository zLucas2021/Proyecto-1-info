extends Area2D

export var es_trampa=false
onready var detec_preso=$RayCast2D
var color_trampa=Color.orange
func _ready():
	if es_trampa:
		$Sprite.modulate=color_trampa
		detec_preso.enabled=true
		rotation_degrees=180
		
func _process(_delta):
	if detec_preso.is_colliding():
		detec_preso.set_deferred('enabled',false)
		$AnimationPlayer.play("caer")
func _on__body_entered(body):
	body.respaw()
