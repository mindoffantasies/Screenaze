extends CharacterBody3D

@onready var pause = $"Neck/Camera3D/Pause"
var paused = false
@onready var GUI = $"Neck/Camera3D/GUI"
@onready var collectable = $"Neck/Camera3D/GUI/Cube"
@onready var goal = get_tree().get_first_node_in_group("goal")
var collected = 0
var minute = 0
var second = 0
var goaled = false
@onready var camera = $"Neck/Camera3D"
@onready var player = self
@onready var trans = self.get_global_transform().basis


const SPEED = 5.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	while(goaled == false):
		second += 1
		if second == 60:
			minute += 1
			second == 0
		GUI.update_lvl(minute, second)
		await get_tree().create_timer(1.0).timeout
		
func _physics_process(_delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if goaled == false:
		if Input.is_action_pressed("turnLeft"):
			player.rotate_y(0.1)
		if Input.is_action_pressed("turnRight"):
			player.rotate_y(-0.1)
		if Input.is_action_pressed("Move"):
			var direction = transform.basis.z
			if direction:
				velocity.x = direction.x * -SPEED
				velocity.z = direction.z * -SPEED
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
				velocity.z = move_toward(velocity.z, 0, SPEED)
		
		
			move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("Esc"):
		gamePaused()
		
func gamePaused():
	if paused:
		pause.hide()
		GUI.show()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		Engine.time_scale = 1
	else:
		pause.show()
		GUI.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Engine.time_scale = 0
	
	paused = !paused
