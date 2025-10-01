extends MeshInstance3D

signal touch_spike

func _on_area_3d_body_entered(_body):
	emit_signal("touch_spike")
