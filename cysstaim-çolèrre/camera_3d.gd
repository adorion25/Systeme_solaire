extends Camera3D
var vitesse_deplacement = 200
var vitesse_rotation = PI/5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Gauche"):
		translate_object_local(Vector3.LEFT * vitesse_deplacement * delta)
	if Input.is_action_pressed("Droite"):
		translate_object_local(Vector3.RIGHT * vitesse_deplacement * delta)
	if Input.is_action_pressed("Devant"):
		translate_object_local(Vector3.FORWARD * vitesse_deplacement * delta)
	if Input.is_action_pressed("Derrière"):
		translate_object_local(Vector3.BACK * vitesse_deplacement * delta)
	if Input.is_action_pressed("Haut"):
		translate_object_local(Vector3.UP * vitesse_deplacement * delta)
	if Input.is_action_pressed("Bas"):
		translate_object_local(Vector3.DOWN * vitesse_deplacement * delta)

	if Input.is_action_pressed("Inclinaison_haut"):
		rotate_object_local(Vector3.RIGHT, vitesse_rotation * delta)
	if Input.is_action_pressed("Inclinaison_bas"):
		rotate_object_local(Vector3.LEFT, vitesse_rotation * delta)
	if Input.is_action_pressed("Rotation_droite"):
		rotate_object_local(Vector3.DOWN, vitesse_rotation * delta)
	if Input.is_action_pressed("Rotation_gauche"):
		rotate_object_local(Vector3.UP, vitesse_rotation * delta)
		
	if Input.is_action_just_pressed("Reset"):
		position = Vector3(0, -450, 250)
		rotation = Vector3(7*PI/18, 0, 0)
