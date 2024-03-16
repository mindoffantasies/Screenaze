extends Area3D
@onready var animation = $"Animation"
@onready var collected = get_node("../Player").collected
@onready var collectable = get_node("../Player").collectable

func _ready():
	animation.play("default")


func _on_collectable_area_entered(_area):
	collected += 1
	print(collected)
	collectable.text = "x" +str(collected)
	self.queue_free()

