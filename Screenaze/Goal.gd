extends Area3D
@onready var player = get_tree().get_first_node_in_group("player")
@onready var goalMenu = player.get_node("Neck/Camera3D/GoalMenu")
@onready var label = goalMenu.get_node("Result")
@onready var pause = player.get_node("Neck/Camera3D/Pause")
@onready var GUI = player.get_node("Neck/Camera3D/GUI")
#@onready var collected = player.collected


func _goal_entered(body:Node3D):
	if body.is_in_group("player"):
		player.goaled = true
		goalMenu.show()
		GUI.hide()
		#Refer to collectable.gd for more info.
		print("Collectables:" + str(player.collected))
		goalMenu.update_ui(player.collected, player.minute, player.second)
