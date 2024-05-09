extends Control
@onready var label = $Result
@onready var player = get_tree().get_first_node_in_group("player")
@onready var goal = get_tree().get_first_node_in_group("goal")

func update_ui(amount, m, s):
	var scn
	if get_tree().current_scene.name == "Demo":
		scn = "Demo"
	if get_tree().current_scene.name == "testLvl":
		scn = "Test"
	label.text = "Level: " + str(scn) + "\nTime: " + str(m) + ":" + str(s) + "\nCollectables: " + str(amount)
	
func _process(delta):
	if player.goaled == true:
		if Input.is_action_pressed("Enter"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Globals.load_level("res://main_menu.tscn")
		if Input.is_action_pressed("Esc"):
			player.paused = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Globals.load_level("res://main_menu.tscn")
