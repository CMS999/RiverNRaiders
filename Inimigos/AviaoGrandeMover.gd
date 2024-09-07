extends PathFollow2D
class_name AviaoMover

var speed := 0.4
@export var whenTrasition := 0.6
@export var whenStop := 0.6
signal transition
var once = true;

func _process(delta):
	progress_ratio += speed * delta
	if progress_ratio >= whenTrasition and once:
		transition.emit()
		once = false
	

func setSpeed(newSpeed: float):
	speed = newSpeed;

func setWhenTrasition(When:float):
	whenTrasition = When

func setWhenStop(When:float):
	whenStop = When
