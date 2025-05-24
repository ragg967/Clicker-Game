extends Label

var score := 0.0
@onready var more_pph = get_node("/root/main/store/more_pph")
@onready var pph_multiplier = get_node("/root/main/store/pph_multiplier")
@onready var ball = get_node("/root/main/ball")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text = "Score: %.2f" % score


func _pph_multiplier():
	score -= pph_multiplier.price
	ball.mult += 0.1
	pph_multiplier.price *= 1.1


func _more_pph():
	score -= more_pph.price
	ball.points_per_hit += 0.1
	more_pph.price *= 1.1


func _update_score():
	score += ball.points_per_hit * ball.mult
