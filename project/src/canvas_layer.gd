extends CanvasLayer


var keyInput: LineEdit
var valueInput: LineEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	keyInput = $TextureRect/keyinput
	valueInput = $TextureRect/valueinput
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:	
	var jsString = "localstorage.setItem(%s,%s)"
	var completeString = jsString % [keyInput.text, valueInput.text]
	
	if OS.has_feature('web'):
		JavaScriptBridge.eval(completeString)
	else:
		print("The JavaScriptBridge singleton is NOT available")
