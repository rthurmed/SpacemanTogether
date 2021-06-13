extends Node2D


func _on_EndArea_body_entered(body):
	if body.name.begins_with('Spaceman'):
		get_tree().change_scene("res://src/YouWin.tscn")
