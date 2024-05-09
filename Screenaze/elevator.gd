extends Area3D
@onready var animation = $"Animation"
@onready var player = get_tree().get_first_node_in_group("player")
@onready var pos = player.global_position.y
@onready var camera = player.get_node("Neck/Camera3D")

@onready var stage = get_tree().get_first_node_in_group("stage")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("default")

#Same as the collectabe.gd.
func _elevator(body:Node3D):
	print(pos)

	#Check for the player group.
	if body.is_in_group("player"):
		stage.scale.y = stage.scale.y * -1
		print(stage.scale.y)
