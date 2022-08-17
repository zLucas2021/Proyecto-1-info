extends Control

onready var etiquetas_vidas=$contenedor_vidas/cantidad
onready var etiquetas_monedas_oro=$contenedormoneda_oro/cantidad
onready var etuiquetas_monedas_plata=$contenedormoneda_plata/cantidad
onready var etiquetas_monedas_bronce=$contenedormoneda_bronze/cantidad
onready var etiquetas_llaves=$contenedor_zanahorias/cantidad
func _ready():
# warning-ignore:return_value_discarded
	Player.connect("actualizar_datos",self,"actaulizar_hud")
	actaulizar_hud()

func actaulizar_hud():
	etiquetas_vidas.text= '%s'% Player.vidas
	etiquetas_monedas_oro.text='%s'% Player.moneda_oro
	etuiquetas_monedas_plata.text='%s'% Player.moneda_plata
	etiquetas_monedas_bronce.text='%s'% Player.moneda_bronce
	etiquetas_llaves.text='%s'% Player.llaves
