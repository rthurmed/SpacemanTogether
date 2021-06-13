extends State


onready var spaceman: Spaceman = owner

var torque_speed = 75
var impulse_speed = Vector2.UP * 120

var input: Vector2
var impulse: Vector2
var impulsed: bool


func process(_delta: float):
	input = Vector2.RIGHT * (
		Input.get_action_strength(spaceman.input_str("right")) - 
		Input.get_action_strength(spaceman.input_str("left"))
	)
	
	impulsed = Input.is_action_pressed(spaceman.input_str("up"))
	impulse = int(impulsed) * impulse_speed
	
	spaceman.jetpack_particles.emitting = impulsed


func physics_process(delta: float):
	spaceman.apply_torque_impulse(input.x * delta * torque_speed)
	spaceman.apply_central_impulse(impulse.rotated(spaceman.global_rotation) * delta)


func enter():
	spaceman.animation.play("fly")


func exit(): pass
