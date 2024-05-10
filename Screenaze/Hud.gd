extends Control

@onready var cube_amount = $Cube
@onready var level = $Lvl
@onready var levelnum = $Lvlnum
@onready var player = get_tree().get_first_node_in_group("player")

func update_cube(amount):
	cube_amount.text = "x" + str(amount)

func update_lvl(m, s):
	level.text = str(player.scn) + " " + str(m) + ":" + str(s)
	levelnum.text = str(player.scnnum)
