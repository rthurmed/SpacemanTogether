extends RigidBody2D


func _ready():
	$AnimationPlayer.play("autoplay")


func _on_Spinblade_body_entered(body):
	print_debug(body.name)
	if body.name.starts_with("Spaceman"):
		var _ok = get_tree().reload_current_scene()
