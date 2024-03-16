extends Control

@onready var player = $"../../../"

func _on_btn_play_pressed():
	player.gamePaused()


func _on_btn_quit_pressed():
	get_tree().quit()
