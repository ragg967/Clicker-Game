extends Label

var score := 0.0
var points_per_hit := 1.0 # This will be refracned as pph is other places

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _more_pph():
	points_per_hit += 0.1

func _update_score():
	score += points_per_hit
	text = "Score: %s" % score
