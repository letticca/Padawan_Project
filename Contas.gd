extends Node2D


var x; var y
var res
var numberpad = [[" 7", "8", "9"] ,[" 4", "5", "6"]  ,[ "1" , "2 ", "3"], ["Del", "0", "Ok"]]

func _ready():
	x = 1
	y = 3
	res = ""
 
func _process(delta):
	#funciona a cada frame
	if Input.is_action_just_pressed("enter"):
		if numberpad[x][y] == "Del":
			res = ""
		elif numberpad[x][y] == "Ok":
			#verificaçao com a resposta
			pass
		else:
			res += numberpad[x][y]
	
