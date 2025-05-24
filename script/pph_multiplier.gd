extends Button

signal pph_multiplier

var price := 50.0
@onready var stat_board = get_node("/root/main/stat_board/score_board")  # Adjust path as needed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if stat_board:
		pph_multiplier.connect(stat_board._pph_multiplier)
		text = "PPH Multiplier: %.2f" % price
	else:
		push_error("stat_board node not found!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pressed() -> void:
	if stat_board.score >= price:
		price *= 1.1
		emit_signal(&"pph_multiplier")
		text = "PPH Multiplier: %.2f" % price
	else:
		print("your broke XD")
	emit_signal(&"pph_multiplier")
