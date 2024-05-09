extends Area3D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var hud = get_tree().get_first_node_in_group("hud")

@onready var animation = $"Animation"
@onready var collectable = player.collectable

func _ready():
	animation.play("default")


#Connected the signal to the collectable instead of the player.
func _player_collected(body:Node3D):
	# Check if the body is a player.
	if body.is_in_group("player"):
		player.collected += 1 
		"""
		Refactored the player's score.

		This will also allow the player to collect more than one collectable
		and it will display properly at the Level Complete screen.

		You're welcome!
		"""
		hud.update_cube(player.collected)
		self.queue_free()
