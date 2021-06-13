extends Control


func _ready():
	$AnimationPlayer.play("autoplay")
	$PlayAgain.grab_focus()


func _on_PlayAgain_pressed():
	var _ok = get_tree().change_scene("res://src/Main.tscn")
