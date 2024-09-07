extends Path2D

func _ready():
	$AviaoGrandeMover.connect("transition", $AviaoGrandeMover/AviaoGrande.transiton)
	
