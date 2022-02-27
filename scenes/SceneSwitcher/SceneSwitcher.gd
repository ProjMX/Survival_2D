extends Node

onready var current_scene = $MainMenu
onready var anim = $AnimationPlayer

var next_scene = null

func _ready():
	connect_signal()

func handle_scene_changed(next_scene_name: String):
	next_scene = load("res://scenes/" + next_scene_name + "/" + next_scene_name + ".tscn").instance()
	anim.play("Fade_In")

func _on_AnimationPlayer_animation_finished(anim_name:String):
	if anim_name == "Fade_In":
		add_child(next_scene)
		current_scene.cleanup()
		current_scene = next_scene
		connect_signal()
		next_scene = null
		anim.play("Fade_Out")

func connect_signal():
	current_scene.connect("scene_switched", self, "handle_scene_changed")
