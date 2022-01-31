extends VBoxContainer

func _ready():
	pass

# Signals
func _on_Back_gui_input(event:InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.is_pressed():
		get_node("../../..").hide()


func _on_ToggleWIP_gui_input(event:InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.is_pressed():
		var wipElement = get_node("../../../../Menu/MarginContainer/VBoxContainer/MenuEntries/MultiPlayer")
		if wipElement.is_visible_in_tree():
			wipElement.hide()
		else:
			wipElement.show()
		var ToggleWIPStat = get_node("ToggleWIPBox/ToggleWIPStat")
		if ToggleWIPStat.text == "off":
			ToggleWIPStat.text = "on"
		else:
			ToggleWIPStat.text = "off"

func _on_Debug_gui_input(event:InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.is_pressed():
		var DebugStat = get_node("DebugBox/DebugStat")
		if DebugStat.text == "off":
			DebugStat.text = "on"
		else:
			DebugStat.text = "off"

func _on_WindowModeMenu_item_selected(index:int):
	match index:
		0:
			OS.window_fullscreen = false
			OS.window_borderless = false
			print("Windowed")
		1:
			OS.window_fullscreen = false
			OS.window_borderless = true
			print("Borderless")
		2:
			OS.window_fullscreen = true
			OS.window_borderless = false
			print("Full Screen")
	OS.center_window()


func _on_WindowModeSize_item_selected(index:int):
	match index:
		0:
			OS.set_window_size(Vector2(1920,1080))
		1:
			OS.set_window_size(Vector2(1280,720))
	OS.center_window()
