extends CanvasLayer

var playing_text = true
var _index = 0
var imagens = [
	"res://Parallax/Cartooon/Historia/Padawan vitorioso.png"
]
var textos = [
	"Padawan comemora por ter conseguido salvar o universo das forças do mal e se torna um Jedi.",
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
			_next()
			_index += 1

func _on_Tween_tween_started(object, key):
	playing_text = true

func _on_Tween_tween_completed(object, key):
	playing_text = false
