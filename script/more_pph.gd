extends Button

signal more_pph

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var score_board = get_node("/root/main/score_borad/score_borad")  # Adjust path as needed
	if score_board:
		more_pph.connect(score_board._more_pph)
	else:
		push_error("score_borad node not found!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	emit_signal("more_pph")
