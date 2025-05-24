extends Button

signal more_pph

var price := 5.0
@onready var stat_board = get_node("/root/main/stat_board/score_board")  # Adjust path as needed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if stat_board:
		more_pph.connect(stat_board._more_pph)
		text = "More PPH: %.2f" % price
	else:
		push_error("stat_board node not found!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pressed() -> void:
	if stat_board.score >= price:
		emit_signal("more_pph")
		text = "More PPH: %.2f" % price
	else:
		print("your broke XD")
