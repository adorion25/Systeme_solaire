extends Control
class_name interface

var astre_clique : Node

@export_group("Textes")
@export var nom_astre : Label
@export var masse_du_corps : Label
@export var vitesse_au_perihelie : Label
@export var excentricite_de_lorbite : Label
@export var periode_revolution_autour_soleil : Label
@export var periode_rotation_sur_soi : Label
@export var vitesse_simulation : Label


func _process(delta:float) -> void:
	if astre_clique != null:
		nom_astre.text = str(astre_clique.name)
		masse_du_corps.text = str(format_scientifique(astre_clique.masse_corps)) + " kg"
		periode_rotation_sur_soi.text = str("%.3f" % (astre_clique.periode_rotation)) + " jours terrestres"
		if astre_clique.name != "Soleil":
			vitesse_au_perihelie.text = str(format_scientifique(astre_clique.vitesse_perihelie)) + " m/s"
			excentricite_de_lorbite.text = str(astre_clique.excentricite)
			periode_revolution_autour_soleil.text = str("%.1f" % (astre_clique.periode/2.628e6)) + " mois terrestres"
		else:
			vitesse_au_perihelie.text = ""
			excentricite_de_lorbite.text = ""
			periode_revolution_autour_soleil.text = ""


func format_scientifique(valeur : float) -> String:
	"""Converti en format scientifique les nombres décimaux avec 3 décimales et uniquement 1 chiffre avant la virgule
	
	Parametre:
	valeur -- la valeur à afficher de façon scientifique
	
	Retour:
	une chaîne de caractères représentant ce nombre
	"""
	var nombre_decimales = int(log(valeur) / log(10))
	var nombre_presente = valeur / 10.0**nombre_decimales
	while nombre_presente >= 10.0:
		nombre_presente = nombre_presente/10.0
		nombre_decimales += 1

	return "%.3f" % nombre_presente + "e" + "%s" % nombre_decimales


func _on_h_slider_value_changed(valeur: float) -> void:
	"""Modifie l'échelle de temps de la simulation lorsque le slider est utilisé
	
	Parametre:
	valeur -- la valeur du multiplicateur de temps
	
	Retour:
	une chaîne de caractères représentant ce nombre
	"""
	Astre.echelle_temps = valeur
	vitesse_simulation.text = "Chaque seconde vaut " + "%.2f" % valeur + " mois terrestres"
