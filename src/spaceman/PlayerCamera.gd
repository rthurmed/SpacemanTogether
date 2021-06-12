extends Camera2D


onready var spaceman0 = get_node("../Spaceman0")
onready var spaceman1 = get_node("../Spaceman1")

export var speed = 2


func _process(delta):
	var diff = (spaceman0.global_position - spaceman1.global_position) / 2
	var target = spaceman0.global_position - diff
	global_position = lerp(global_position, target, delta * speed)
