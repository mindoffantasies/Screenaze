extends Node

var loading_screen = preload("res://Loader.tscn")

var next_scene : String = "res://Game.tscn"


func load_level(level):
	next_scene = level
	get_tree().change_scene_to_packed(loading_screen)