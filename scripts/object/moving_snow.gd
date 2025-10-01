extends Path3D

@export var speed: float = 1
@onready var anim = $AnimatableBody3D/AnimationPlayer

func _ready():
	anim.speed_scale = speed
