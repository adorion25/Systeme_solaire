extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Gauche"):
		position += Vector3(-20, 0, 0)
	elif Input.is_action_just_pressed("Droite"):
		position += Vector3(20, 0, 0)
	elif Input.is_action_just_pressed("Devant"):
		position += Vector3(0, 20, 0)
	elif Input.is_action_just_pressed("Derrière"):
		position += Vector3(0, -20, 0)
	elif Input.is_action_just_pressed("Inclinaison_haut"):
		rotation += Vector3(PI/24, 0, 0)
	elif Input.is_action_just_pressed("Inclinaison_bas"):
		rotation += Vector3(-PI/24, 0, 0)
	elif Input.is_action_just_pressed("Rotation_droite"):
		rotation += Vector3(-PI/24, PI/24, PI/8)
	elif Input.is_action_just_pressed("Rotation_gauche"):
		rotation += Vector3(PI/24, -PI/24, -PI/8)
