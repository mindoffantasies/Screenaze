extends Area3D
@onready var player = get_tree().get_first_node_in_group("player")
@onready var goalMenu = player.get_node("Neck/Camera3D/GoalMenu")
@onready var label = goalMenu.get_node("Result")
@onready var pause = player.get_node("Neck/Camera3D/Pause")
@onready var GUI = player.get_node("Neck/Camera3D/GUI")
#@onready var collected = player.collected


var goaled = false


func _goal_entered(body:Node3D):
	if body.is_in_group("player"):
		!goaled
		goalMenu.show()
		GUI.hide()
		#Refer to collectable.gd for more info.
		print("Collectables:" + str(player.collected))
		goalMenu.update_ui(player.collected)
		if goaled == true:
			if Input.is_action_pressed("Enter"):
				Globals.load_level("res://main_menu.tscn")
				!goaled
			if Input.is_action_pressed("Esc"):
				pause.hide()
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
