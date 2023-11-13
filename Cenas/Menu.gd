extends Node

func _ready():
	$TimerEsperaTocar.start()

func _start():
	
	Hud.visible = false
	get_tree().change_scene("res://Cenas/CenaHistoria.tscn")

func _on_TimerEsperaTocar_timeout():
	$AudioTema.play()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_start()

func _on_Button_pressed():
	_start()
