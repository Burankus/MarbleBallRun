extends Node3D

signal reach_goal

func _on_area_3d_body_entered(_body):
	emit_signal("reach_goal")
