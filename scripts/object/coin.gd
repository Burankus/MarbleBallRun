extends Area3D

@export var rotation_speed: float = 2
signal collected_coin

func _process(delta):
	rotate_y(deg_to_rad(rotation_speed))

func _on_body_entered(body):
	queue_free()
	emit_signal("collected_coin")
