extends CanvasLayer

var playing_text = true
var _index = 0
var imagens = [
	"res://Parallax/Cartooon/Historia/Darth Vader Anuncio.jpg",
	"res://Parallax/Cartooon/Historia/DarthVader.jpg",
	"res://Parallax/Cartooon/Historia/ProtaUltimaCenaComeco.jpg",
]
var textos = [
	
	"Enquanto isso, Darth Vader estava planejando atacar a vila Ghindlr para continuar expandindo seu império",
	"Não muito tempo depois, Ghindlr já estava sendo atacada pelos seus soldados",
	"Padawan, preocupado com o futuro do universo, resolve entrar em uma missão para salvar os planetas que correm perigo."
]

func _ready():
	Hud.visible = false

func _next():
	#Muda a imagem do sprite
	$Sprite.texture = load(imagens[_index])
	$Sprite.position.y = 112
	$Sprite.scale.x = 1
	$Sprite.scale.y = 0.7
	#Muda o texto relacionado à imagem
	$Label.text = textos[_index]
	$Label._write()

func _process(delta):
	if $Sprite.position.y < 274:
		$Sprite.position.y += 0.50
	if Input.is_action_just_pressed("ui_accept"):
		if playing_text:
			$Label/Tween.stop_all()
			$Label.visible_characters = -1
			playing_text = false
		else:
			if _index < 3:
				_next()
				_index += 1

func _on_Tween_tween_completed(object, key):
	playing_text = false

func _on_Tween_tween_started(object, key):
	playing_text = true
