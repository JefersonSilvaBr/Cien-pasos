extends Node2D

onready var player_ref = get_parent().get_node("PC/Player").global_position.x
onready var reflex_ref = get_parent().get_node("PC/PlayerReflex").global_position.x

var distance
var part_bb
var volume_part_bb

func _ready():
	distance = abs(player_ref - reflex_ref)
	part_bb = (80 / distance)

func _process(delta):
	player_ref = get_parent().get_node("PC/Player").global_position.x
	reflex_ref = get_parent().get_node("PC/PlayerReflex").global_position.x
	distance = abs(player_ref - reflex_ref)
	FinalFransit.get_node("PartBB").volume_db = (part_bb * distance) * -1
