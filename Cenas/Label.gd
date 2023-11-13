extends Label

func _ready():
	_write()

func _write():
	percent_visible = 0
	$Tween.interpolate_property(
		self, "percent_visible",
		0.0, 1.0, 4.0, Tween.EASE_IN, Tween.EASE_OUT
	)
	$Tween.start()
