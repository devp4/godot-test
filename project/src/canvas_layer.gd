extends CanvasLayer


var keyInput: LineEdit
var valueInput: LineEdit
var getValueInput: LineEdit
var outputLabel: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	keyInput = $TextureRect/keyinput
	valueInput = $TextureRect/valueinput
	getValueInput = $TextureRect/getvalueinput
	outputLabel = $TextureRect/ColorRect/outputlabel
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:	
	var jsString = "localStorage.setItem(%s,%s)"
	var completeString = jsString % [keyInput.text, valueInput.text]
	
	if OS.has_feature('web'):
		JavaScriptBridge.eval(completeString)
	else:
		print("The JavaScriptBridge singleton is NOT available")


func _on_button_2_pressed() -> void:
	var jsString = "localStorage.getItem(%s)"
	var completeString = jsString % [getValueInput.text]
	
	var result
	if OS.has_feature('web'):
		var jsResult = JavaScriptBridge.eval(completeString)
		if (jsResult): result = jsResult
		else: result = "Could not find key"
	else:
		result = "Could not get localstorage"
	
	outputLabel.text = result
	
