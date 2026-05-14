extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pressed.connect(changer_mode_pause)

func changer_mode_pause() -> void:

	Astre.pause = !Astre.pause
	
	if Astre.pause :
		text = "Reprendre"
	else :
		text = "Pause"
