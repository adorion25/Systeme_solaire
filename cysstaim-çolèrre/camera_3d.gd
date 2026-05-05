extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var vitesse_deplacement = 2
	if Input.is_action_pressed("Gauche"):
		translate_object_local(Vector3.LEFT * vitesse_deplacement)
		vitesse_deplacement += 0.1
		if Input.is_action_just_released():
			vitesse_deplacement = 2
	elif Input.is_action_pressed("Droite"):
		translate_object_local(Vector3.RIGHT * vitesse_deplacement)
	elif Input.is_action_pressed("Devant"):
		translate_object_local(Vector3.FORWARD * vitesse_deplacement)
	elif Input.is_action_pressed("Derrière"):
		translate_object_local(Vector3.BACK * vitesse_deplacement)

	var vitesse_rotation = PI / 100
	
	if Input.is_action_pressed("Inclinaison_haut"):
		rotate_object_local(Vector3.RIGHT, vitesse_rotation)
	elif Input.is_action_pressed("Inclinaison_bas"):
		rotate_object_local(Vector3.LEFT, vitesse_rotation)
	elif Input.is_action_pressed("Rotation_droite"):
		global_rotate(Vector3.BACK, -vitesse_rotation)
	elif Input.is_action_pressed("Rotation_gauche"):
		global_rotate(Vector3.BACK, vitesse_rotation)
