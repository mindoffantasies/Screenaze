extends Control

@onready var cube_amount = $Cube
@onready var level = $Lvl

func update_cube(amount):
	cube_amount.text = "x" + str(amount)