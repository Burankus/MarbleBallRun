extends Path3D

signal touch_spike

@export var speed: float = 1
@onready var anim = $AnimatableBody3D/AnimationPlayer

func _ready():
	anim.speed_scale = speed

func _on_spikeblockwide_touch_spike():
	emit_signal("touch_spike")
