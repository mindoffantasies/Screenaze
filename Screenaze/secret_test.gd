extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_key_pressed(KEY_F1):
		Globals.load_level("res://Test.tscn")
