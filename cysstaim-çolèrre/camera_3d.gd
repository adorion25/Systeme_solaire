extends Camera3D
var vitesse_deplacement = 2
var vitesse_rotation = PI/200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	vitesse_deplacement += 0.1
	vitesse_rotation += PI/2000
	if Input.is_action_pressed("Gauche"):
		translate_object_local(Vector3.LEFT * vitesse_deplacement)
	elif Input.is_action_pressed("Droite"):
		translate_object_local(Vector3.RIGHT * vitesse_deplacement)
	elif Input.is_action_pressed("Devant"):
		translate_object_local(Vector3.FORWARD * vitesse_deplacement)
	elif Input.is_action_pressed("Derrière"):
		translate_object_local(Vector3.BACK * vitesse_deplacement)
	elif Input.is_action_pressed("Haut"):
		translate(Vector3.UP * vitesse_deplacement)
	elif Input.is_action_pressed("Bas"):
		translate(Vector3.DOWN * vitesse_deplacement)
	else :
		vitesse_deplacement = 2

	if Input.is_action_pressed("Inclinaison_haut"):
		rotate_object_local(Vector3.RIGHT, vitesse_rotation)
	elif Input.is_action_pressed("Inclinaison_bas"):
		rotate_object_local(Vector3.LEFT, vitesse_rotation)
	elif Input.is_action_pressed("Rotation_droite"):
		global_rotate(Vector3.BACK, -vitesse_rotation)
	elif Input.is_action_pressed("Rotation_gauche"):
		global_rotate(Vector3.BACK, vitesse_rotation)
	else :
		vitesse_rotation = PI/200
	if Input.is_action_just_pressed("Reset"):
		position = Vector3(0, -450, 250)
		rotation = Vector3(7*PI/18, 0, 0)
