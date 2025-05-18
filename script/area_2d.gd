extends Area2D

signal update_score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Wait until scene is fully loaded
	await get_tree().process_frame
	
	# Find the UI node in the scene tree
	var score_board = get_node("/root/main/score_borad/score_borad")  # Adjust path as needed
	if score_board:
		update_score.connect(score_board._update_score)
	else:
		push_error("score_borad node not found!")

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	emit_signal("update_score")
