extends Control

@onready var cube_amount = $Cube
@onready var level = $Lvl

func update_cube(amount):
	cube_amount.text = "x" + str(amount)

func update_lvl(m, s):
	var scn
	if get_tree().current_scene.name == "Demo":
		scn = "Demo"
	if get_tree().current_scene.name == "testLvl":
		scn = "Test"
	level.text = str(scn) + " " + str(m) + ":" + str(s)
