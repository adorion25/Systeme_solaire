extends RigidBody3D

@export_group("Paramètre de conversion simulation")
@export var min_distance_simulee : float
@export var max_distance_simulee : float
@export var min_distance_reelle  : float
@export var max_distance_reelle  : float

@export_group("Astres gravitationnels")
@export var Soleil  : RigidBody3D
@export var Mercure : RigidBody3D
@export var Venus   : RigidBody3D
@export var Terre   : RigidBody3D
@export var Mars    : RigidBody3D
@export var Jupiter : RigidBody3D
@export var Saturne : RigidBody3D
@export var Uranus  : RigidBody3D
@export var Neptune : RigidBody3D

@export_group("Simulation gravitationnelle")
@export var masse_corps : float
@export var periode_relative : float
@export var position_initiale : Vector3
@export var vitesse_initiale : Vector3

@export_group("Paramètres de simulation")
@export var etapes_calcul_par_ecran : int

var G : float = 6.674e-11
var position_reelle : Vector3
var vitesse : Vector3
var periode : float = 299.819e3
var temps_ecoule : float

var pause : bool

var echelle_temps : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position_reelle = position_initiale
	vitesse = vitesse_initiale
	
	pause = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pause :
		return
	
	temps_ecoule += delta 
	if temps_ecoule >= 20 * periode_relative:
		return
		

	appliquer_euler(delta*echelle_temps)

	position = conv_position_reelle_a_simulee()
	
func conv_position_reelle_a_simulee() -> Vector3:
	"""Effectue la conversion d'une position réelle à une position de l'espace 
	de la simulation
	
	Paramètres:
	position_reelle -- la position réelle à convertir
	
	Retour :
	la position dans le monde de la simulation à utiliser
	"""
	
	var distance_relle = position_reelle.length()
	var ratio_distance = inverse_lerp(min_distance_reelle, max_distance_reelle, 
		distance_relle)
	var facteur_distance_simulee = lerp (min_distance_simulee, max_distance_simulee,
		ratio_distance)
	
	return position_reelle.normalized() * facteur_distance_simulee

func acceleration_gravitationnelle(autre_corps: RigidBody3D, position_i) -> Vector3:
	"""
	Calcule le vecteur 3D de l'accélération agissant sur le corps par rapport à l'astre donné
	à l'aide de la position actuelle de l'astre donné.
	
	Paramètre :
	position réelle de l'astre dans le plan 3D
	"""
	var scalaire = -1 * G * autre_corps.masse_corps / position_i.length()**3
	return scalaire * position_i
	
func acceleration_totale(position_i) -> Vector3:
	"""Additione toutes les accélérations causées par les autres astres pour 
	en n'avoir qu'une seule.
	
	Retour:
	Vecteur d'accélération gravitaionnelle totale agissant sur le corps.
	"""
	
	var a_tot = acceleration_gravitationnelle(Soleil, position_i) + acceleration_gravitationnelle(Mercure, position_i) + acceleration_gravitationnelle(Venus, position_i) + acceleration_gravitationnelle(Terre, position_i) + acceleration_gravitationnelle(Mars, position_i) + acceleration_gravitationnelle(Jupiter, position_i) + acceleration_gravitationnelle(Saturne, position_i) + acceleration_gravitationnelle(Uranus, position_i) + acceleration_gravitationnelle(Neptune, position_i)
	
	return a_tot
	
func appliquer_euler(temps_dernier_ecran : float) -> void:
	"""
	Applique la méthode d'Euler pour déterminer la position et la vitesse selon
	le temps de la simulation. Toutes les forces en jeu sur l'objet y sont calculées 
	pour simuler la position future.
	
	Paramètre:
	temps_dernier_ecran -- le temps écoulé depuis le dernier écran.
	"""
	var nb_periode = temps_dernier_ecran * periode / periode_relative
	var h = nb_periode / etapes_calcul_par_ecran
	var temps = 0
	while temps <= nb_periode:
		var k1 = acceleration_totale(position_reelle)
		var k2 = acceleration_totale(position_reelle + k1 * h/2)
		var k3 = acceleration_totale(position_reelle + k2 * h/2)
		var k4 = acceleration_totale(position_reelle + k3 * h)
		vitesse += h*(k1 + 2*k2 + 2*k3 + k4)/6
		
		position_reelle += vitesse * h
		temps += h
	

func mettre_en_pause(mode_pause: bool) -> void:
	"""Change le mode de la simulation (pause/"play")
	
	Parametre :
	mode_pause -- booléen contenant True si la simulation est en pause.
	"""
	pause = mode_pause
