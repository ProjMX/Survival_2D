extends VBoxContainer

func _ready():
	pass

# Signals
func _on_Settings_gui_input(event:InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.is_pressed():
		get_node("../../../../Settings").show()
		
func _on_Exit_gui_input(event:InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.is_pressed():
		get_tree().quit()
