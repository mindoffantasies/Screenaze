extends Control
@onready var label = $Result
@onready var player = get_tree().get_first_node_in_group("player")
@onready var goal = get_tree().get_first_node_in_group("goal")

func update_ui(amount, m, s):
	label.text = "Level: " + str(player.scn) + "\nTime: " + str(m) + ":" + str(s) + "\nCollectables: " + str(amount) + "/" + str(player.colamount)
	
func _process(_delta):
	if player.goaled == true:
		if Input.is_action_pressed("Enter"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Globals.load_level("res://main_menu.tscn")
		if Input.is_action_pressed("Esc"):
			player.paused = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Globals.load_level("res://main_menu.tscn")
