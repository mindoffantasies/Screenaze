extends Control

@onready var player = $"../../../"


func _process(_delta):
	if Input.is_action_pressed("Esc"):
		await get_tree().create_timer(5.0).timeout
		player.gamePaused()

func _on_btn_play_pressed():
	player.gamePaused()
	


func _on_btn_quit_pressed():
	player.goaled = true
	Globals.load_level("res://main_menu.tscn")
	Engine.time_scale = 1	
	
