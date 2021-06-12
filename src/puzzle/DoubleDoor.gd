extends Node2D


export var code: int = 99
export var invert: bool = false


func _ready():
	var _ok1 = PuzzleManager.connect("activate", self, "_PuzzleManager_activate")
	var _ok2 = PuzzleManager.connect("deactivate", self, "_PuzzleManager_deactivate")
	if invert:
		open()


func _PuzzleManager_activate(_code):
	if not _code == code: return
	if invert:
		close()
	else:
		open()


func _PuzzleManager_deactivate(_code):
	if not _code == code: return
	if invert:
		open()
	else:
		close()


func open():
	$Door1.open()
	$Door2.open()


func close():
	$Door1.close()
	$Door2.close()
