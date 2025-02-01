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
	var key = keyInput.text
	var value = valueInput.text
	
	if OS.has_feature('web'):
		# Directly call localStorage methods without eval
		JavaScriptBridge.get_interface("localStorage").setItem(key, value)
	else:
		print("LocalStorage not available (set)")


func _on_button_2_pressed() -> void:
	var key = getValueInput.text
	var result = "Could not find key"
	
	if OS.has_feature('web'):
		# Get item and check for null
		var js_result = JavaScriptBridge.get_interface("localStorage").getItem(key)
		result = js_result if js_result != null else "Could not find key"
	else:
		result = "LocalStorage not available (get)"
	
	outputLabel.text = str(result)
	
