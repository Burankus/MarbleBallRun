extends RigidBody3D

@onready var Camera = $"../CameraPivot"
@onready var marble_color = $MeshInstance3D

@export var speed: float = 750.0
@export var boosted_speed: float = 1250.0
@export var max_velocity: float = 10.0
@export var min_velocity: float = -10.0
@export var max_boosted_velocity: float = 13.0
@export var min_boosted_velocity: float = -13.0

func _physics_process(delta):
	playerMovement(delta)

func playerMovement(delta):
	var inputVector = Vector3.ZERO
	
	inputVector.z = Input.get_axis("moveUp", "moveDown")
	inputVector.x = Input.get_axis("moveLeft", "moveRight")
	if inputVector.length_squared() > 1.0:
		inputVector = inputVector.normalized()
	
	inputVector = Vector3(inputVector.x, 0, inputVector.z).rotated(Vector3.UP, Camera.rotation.y)
	
	if Input.is_action_pressed("speedUp"):
		linear_velocity.x = clamp(linear_velocity.x, min_boosted_velocity, max_boosted_velocity)
		linear_velocity.z = clamp(linear_velocity.z, min_boosted_velocity, max_boosted_velocity)
		apply_central_force(inputVector * boosted_speed * delta)
	else:
		linear_velocity.x = clamp(linear_velocity.x, min_velocity, max_velocity)
		linear_velocity.z = clamp(linear_velocity.z, min_velocity, max_velocity)
		apply_central_force(inputVector * speed * delta)
	#print(linear_velocity.x)
	#print(linear_velocity.z)
