extends RigidBody2D

@export var throw_impulse_multiplier := 20.0  # Adjust this to control throw strength
var dragging := false
var previous_mouse_position := Vector2()
var points_per_hit := 1.0  # This will be refracned as pph in other places
var mult := 1.0  # This will be refracned as pph mult in other places


# Check if ball is grabbed
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Start dragging when pressed
			dragging = true
			# Freeze the physics while dragging
			freeze = true
			previous_mouse_position = get_global_mouse_position()
		elif dragging:
			# Release the ball with velocity
			dragging = false
			# Calculate velocity based on mouse movement
			var velocity = (
				(get_global_mouse_position() - previous_mouse_position) * throw_impulse_multiplier
			)
			# Always unfreeze when releasing the ball
			freeze = false
			# Apply impulse to throw the ball
			apply_central_impulse(velocity)


# If being dragged, move ball with cursor
func _physics_process(_delta):
	if dragging:
		previous_mouse_position = global_position
		global_position = get_global_mouse_position()
