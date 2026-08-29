extends RigidBody3D

var speed = 15.0
var jumpForce = 5.0

func _physics_process(_delta: float) -> void:
	var direction = Vector3.ZERO
	direction.z = Input.get_action_strength("move_fwd")
	
	if direction != Vector3.ZERO:
		var yaw_basis = Basis(Vector3.UP, $CameraHolder.rotation.y)
		apply_central_force(yaw_basis * direction * speed)
		
	if Input.is_action_just_pressed("move_jump") and abs(linear_velocity.y) < 0.1:
		linear_velocity.y = jumpForce

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		$CameraHolder.rotation.y -= event.relative.x * 0.005
		$CameraHolder/Camera3D.rotation.x += - event.relative.y * 0.005
		$CameraHolder/Camera3D.rotation.x = clamp($CameraHolder/Camera3D.rotation.x, deg_to_rad(-90), deg_to_rad(90))
