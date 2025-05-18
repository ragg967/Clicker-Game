extends Button

signal pph_multiplier

var price := 100.0
@onready var score_board = get_node("/root/main/score_borad/score_borad")  # Adjust path as needed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if score_board:
		pph_multiplier.connect(score_board._pph_multiplier)
	else:
		push_error("score_borad node not found!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pressed() -> void:
	if score_board.score >= price:
		price *= 1.1
		emit_signal(&"pph_multiplier")
		text = "PPH Multiplier: %.2f" % price
	else:
		print("your broke XD")
	emit_signal(&"pph_multiplier")
