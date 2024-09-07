extends PathFollow2D
class_name circleMover

var speed := 0.4
var progressToLoop := 0.2

func _process(delta):
	progress_ratio += speed * delta
	if progress_ratio == 1:
		progress_ratio = progressToLoop

func setSpeed(newSpeed: float):
	speed = newSpeed;

func setProgressToLoop(When:float):
	progressToLoop = When