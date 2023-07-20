extends CharacterBody3D

# How fast the player moves in meters per second.
const SPEED = 5.0
# The downward acceleration when in the air, in meters per second squared.

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var Camera = $Camera3D


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
func get_input(delta):

	#Some shoehorned code from the Default movemnt code you can create via CharacterBody3D.
	var input_dir = Vector3(0,0,Input.is_action_pressed("Move"))
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.z)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if Input.is_action_pressed("Turn Right"):
		rotate_y(-4 * delta)
	if Input.is_action_pressed("Turn left"):
		rotate_y(4 * delta)

	print(direction)

	return direction
	#return input_dir

func _physics_process(delta):
		
	if is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		velocity.y -= gravity * delta
	var desired_velocity = get_input(delta) * SPEED
	
	velocity.x = -desired_velocity.x
	velocity.z = -desired_velocity.z
	move_and_collide(velocity * delta)
