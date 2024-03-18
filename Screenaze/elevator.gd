extends Area3D
@onready var animation = $"Animation"
@onready var player = get_node("../Player")
@onready var pos = player.global_position.y
@onready var camera = get_node("../Player/Neck/Camera3D")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("default")

#Same as the collectabe.gd.
func _elevator(body:Node3D):
	print(pos)

	#Check for the player group.
	if body.is_in_group("player"):
		camera.rotate_z(6)

