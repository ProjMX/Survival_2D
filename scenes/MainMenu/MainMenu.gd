extends Control

signal scene_switched(next_scene_name)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func cleanup():
	queue_free()

# Signals
func _on_SinglePlayer_gui_input(event:InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.is_pressed():
		emit_signal("scene_switched", "Base")
