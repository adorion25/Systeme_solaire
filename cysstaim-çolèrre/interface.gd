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
	pass
	if astre_clique != null:
		nom_astre.text = str(astre_clique.name)
		#masse_du_corps.text = str(astre_clique.var)
		#vitesse_au_perihelie.text = str(astre_clique.var)
		#excentricite_de_lorbite.text = str(astre_clique.var)
		#periode_revolution_autour_soleil.text = str(astre_clique.var)
		#periode_rotation_sur_soi.text = str(astre_clique.var)
	#vitesse_simulation.text = str(astre_clique.var)


func format_scientifique(valeur : float) -> String:
	"""Converti en format scientifique les nombres décimaux avec 3 décimales
	
	Parametre:
	valeur -- la valeur à afficher de façon scientifique
	
	Retour:
	une chaîne de caractères représentant ce nombre
	"""
	var nombre_decimales = int(log(valeur) / log(10))
	var nombre_presente = valeur / 10**nombre_decimales
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
