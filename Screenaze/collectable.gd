extends Area3D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var hud = get_tree().get_first_node_in_group("hud")

@onready var animation = $"Animation"
@onready var collected = player.collected
@onready var collectable = player.collectable

func _ready():
	animation.play("default")


#Connected the signal to the collectable instead of the player.
func _player_collected(body:Node3D):
	# Check if the body is a player.
	if body.is_in_group("player"):
		collected += 1
		print(collected)
		hud.update_cube(collected)
		self.queue_free()
