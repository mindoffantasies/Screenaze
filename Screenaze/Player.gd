extends CharacterBody3D


const SPEED = 5.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	pass
	#ResourceLoader.load_threaded_request("res://pause.tscn")
	#self._on_input_event.connect(_on_input_event)


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dirR = Input.get_action_strength("turnRight") 
	var input_dirL = Input.get_action_strength("turnLeft")
	if input_dirL != 0:
		velocity.z = input_dirL * SPEED
	if input_dirR != 0:
		velocity.z = input_dirR * SPEED
	else:
		velocity.z = SPEED
			
	velocity.x = 0

	move_and_slide()
	
	if Input.is_action_pressed("Esc"):
		get_tree().quit()



func _on_input_event(_camera, _event, _position, _normal, _shape_idx):
	if Input.is_action_pressed("Esc"):
		var pause_scene = ResourceLoader.load_threaded_get("res://pause.tscn")
		var pause = pause_scene.instantiate()
		add_child(pause)
	
