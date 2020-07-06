extends KinematicBody2D

export var speed: = Vector2(200.0, 1000.0)

var velocity: = Vector2.ZERO

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("turn right") - Input.get_action_strength("turn_left"),
		-1.0
	) 


func _physics_process(delta: float) -> void:
	var direction: = get_direction()
	velocity = calculate_move_velocity (velocity, direction, speed)
	velocity = move_and_slide(velocity)

func calculate_move_velocity (
	lenear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2
) -> Vector2:
	var new_velocity: = lenear_velocity
	new_velocity.x = speed.x * direction.x
	return new_velocity
