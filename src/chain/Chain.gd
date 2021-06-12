class_name Chain
extends Node


const PIN_END_BIAS = 1

export var Segment: PackedScene
export var segment_width: int = 8
export var start_path: NodePath
export var end_path: NodePath
export var bias: float = 0.1

var segments: int
var last_segment: RigidBody2D
var last_pin: PinJoint2D


func _ready():
	start_path = get_node(start_path).get_path()
	end_path = get_node(end_path).get_path()
	
	build(
		path_get_pos_or(start_path),
		path_get_pos_or(end_path)
	)


# Build the chains segments
func build(start: Vector2, end: Vector2):
	var half_width = segment_width / 2.0
	var _last_segment = null
	
	segments = int(start.distance_to(end) / float(segment_width))
	
	for i in range(segments):
		var x = half_width + segment_width * i
		var segment = Segment.instance()
		
		segment.position = start + Vector2.RIGHT * x
		
		add_child(segment)
		
		# Pin connect this segment and the last one
		var _pin_position = start + Vector2.RIGHT * (x - half_width)
		
		var _path = start_path
		if _last_segment != null:
			_path = _last_segment.get_path()
		
		create_pin(_pin_position, _path, segment.get_path(), bias)
		
		# Save segment for next iteration
		_last_segment = segment
	
	last_segment = _last_segment
	
	# Connect last pin with the end
	var _last_pin_pos = start + Vector2.RIGHT * (segment_width * segments)
	last_pin = create_pin(_last_pin_pos, last_segment.get_path(), end_path, PIN_END_BIAS)


func path_get_pos_or(that_path: NodePath, default: Vector2 = Vector2.ZERO):
	if has_node(that_path):
		return get_node(that_path).global_position
	else:
		return default


func create_pin(position, node_a, node_b, _bias):
	var pin = PinJoint2D.new()
	pin.position = position
	pin.node_a = node_a
	pin.node_b = node_b
	pin.bias = _bias
	add_child(pin)
	return pin
