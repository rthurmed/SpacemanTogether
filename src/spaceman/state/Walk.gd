extends State


onready var spaceman: Spaceman = owner


func handle_input(_event: InputEvent): pass
func process(_delta: float): pass
func physics_process(_delta: float): pass

func enter():
	spaceman.animation.play("walk")

func exit(): pass
