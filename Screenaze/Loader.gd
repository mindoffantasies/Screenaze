extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	ResourceLoader.load_threaded_request(Globals.next_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var progress = []
	ResourceLoader.load_threaded_get_status(Globals.next_scene, progress)
	print(progress)

	if ResourceLoader.load_threaded_get_status(Globals.next_scene) == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(Globals.next_scene))
