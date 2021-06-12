extends Area2D


const SLOW_STRENGTH = 4
const FORCE_POS_STRENGTH = 2
const CENTERED_DISTANCE = 1
const GROUP_SPHERE = "energy_sphere"
const FRAME_OFF = 0
const FRAME_ON = 1

onready var sprite = $Sprite

export var code: int = 99

var _body: RigidBody2D
var centered = false


func _process(delta):
	if _body == null: return
	if centered: return
	
	# Slide the body to center
	_body.linear_velocity = Vector2.ONE
	_body.angular_velocity = 0.0
	_body.global_position = lerp(_body.global_position, global_position, delta * FORCE_POS_STRENGTH)
	
	centered = global_position.distance_to(_body.global_position) < CENTERED_DISTANCE


func _on_EnergyStation_body_entered(body):
	if (
		_body == null and
		body.is_in_group(GROUP_SPHERE)
	):
		_body = body
		centered = false
		update_frame()
		PuzzleManager.activate(code)


func _on_EnergyStation_body_exited(body):
	if (
		_body != null and
		body.is_in_group(GROUP_SPHERE)
	):
		_body = null
		centered = false
		update_frame()
		PuzzleManager.deactivate(code)


func activated():
	return _body != null


func update_frame():
	if activated():
		sprite.frame = FRAME_ON
	else:
		sprite.frame = FRAME_OFF
