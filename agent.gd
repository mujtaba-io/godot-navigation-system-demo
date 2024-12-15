extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@export var speed: float = 4

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_home"):
		var target_pos: Vector3
		target_pos.x = randf_range(-5.0, 5.0)
		target_pos.z = randf_range(-5.0, 5.0)
		navigation_agent_3d.set_target_position(target_pos)
	
	var next_waypoint = navigation_agent_3d.get_next_path_position()
	var vector_to_next_waypoint = next_waypoint - global_position
	var direction = vector_to_next_waypoint.normalized()
	velocity = direction * speed
	move_and_slide()
