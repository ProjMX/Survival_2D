extends Node2D

# Temp 
export var A_temp = 23.0

signal scene_switched(next_scene_name)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if !GlobalData.debug:
		get_node("KinematicBody2D/Debug").hide()
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		emit_signal("scene_switched", "MainMenu")
	if Input.is_action_just_pressed("ui_select"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func cleanup():
	queue_free()
