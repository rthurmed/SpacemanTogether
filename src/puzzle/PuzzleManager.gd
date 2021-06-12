extends Node


signal activate(code)
signal deactivate(code)


func activate(code):
	emit_signal("activate", code)

func deactivate(code):
	emit_signal("deactivate", code)
