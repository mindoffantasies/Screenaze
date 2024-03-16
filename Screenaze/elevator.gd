extends Area3D
@onready var animation = $"Animation"
@onready var player = get_node("../Player")
@onready var pos = player.global_position.y
@onready var camera = get_node("../Player/Neck/Camera3D")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("default")


func _on_elevator_entered(_area):
	print(pos)
	camera.rotate_z(6)
