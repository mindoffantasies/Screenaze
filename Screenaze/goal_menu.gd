extends Control
@onready var label = $Result

func update_ui(amount):
	label.text = "Collectables: " + str(amount)
