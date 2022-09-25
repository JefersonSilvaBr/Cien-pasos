extends Node2D

onready var player_ref = get_parent().get_node("PC/Player").global_position.x
onready var reflex_ref = get_parent().get_node("PC/PlayerReflex").global_position.x

var distance

var part_aa
var part_bb

var volume_part_aa
var volume_part_bb

func _ready():
	distance = abs(player_ref - reflex_ref)
	part_aa = (10 / distance)
	part_bb = (15 / distance)
	print("part_aa ", part_aa)
	print("part_b ", part_bb)
	print("distancia ", distance)

func _process(delta):
	player_ref = get_parent().get_node("PC/Player").global_position.x
	reflex_ref = get_parent().get_node("PC/PlayerReflex").global_position.x
	distance = abs(player_ref - reflex_ref)
	print("distancia ", distance)
	FinalFransit.get_node("PartAA").volume_db = (part_aa * distance) * -1
	FinalFransit.get_node("PartBB").volume_db = (part_bb * distance) * -1
	print("part_AA ", FinalFransit.get_node("PartAA").volume_db)
	print("part_BB ", FinalFransit.get_node("PartBB").volume_db)
