class_name Spaceman
extends RigidBody2D


onready var animation = $AnimationPlayer
onready var sprite = $Sprite
onready var jetpack_particles = $JetpackParticles2D

export var texture: Texture
export var player_id: int


func _ready():
	sprite.texture = texture


func input_str(command: String) -> String:
	return str(player_id, "_", command)
