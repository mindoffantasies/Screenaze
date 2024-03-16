extends Area3D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var hud = get_tree().get_first_node_in_group("hud")

@onready var animation = $"Animation"
@onready var collected = player.collected
@onready var collectable = player.collectable

func _ready():
	animation.play("default")


func _on_collectable_area_entered(_area):
	collected += 1
	print(collected)
	hud.update_cube(collected)
	self.queue_free()

