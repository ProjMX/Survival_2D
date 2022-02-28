extends KinematicBody2D

# Mass Var (Kg)
export var Mass = 40.0
export var MaxMass = 40.0

# Temp Var (°C)
export var B_Temp = 36.0

# Debug Var
var A_temp = 0

func _physics_process(delta):
	
	var direction = Vector2.ZERO
	
	# Speed & Noise Var
	var speed = 100
	var noise = 100
	
	# Speed calc with Mass factor
	if Mass > MaxMass:
		speed = clamp(speed-(Mass-MaxMass), 50, 100) 
		noise = speed+10
	
	if GlobalData.debug:
		# R Reset (Debug)
		if Input.is_key_pressed(KEY_R):
			Mass = 40
		# PagUp +1 Mass (Debug)
		if Input.is_key_pressed(KEY_PAGEUP):
			Mass += 1
		# PagDown -1 Mass (Debug)
		if Input.is_key_pressed(KEY_PAGEDOWN):
			Mass -= 1
	
	Mass = abs(Mass)
	
	# Shift sprint
	if Input.is_action_pressed("ui_sprint") and Mass <= MaxMass:
		speed = 140
		noise = 160
	# Ctrl crouch
	elif Input.is_action_pressed("ui_crouch"):
		speed = 40
		noise = 30
	# W up
	if Input.is_action_pressed("ui_up"):
		direction += Vector2.UP
	# S down
	if Input.is_action_pressed("ui_down"):
		direction += Vector2.DOWN
	# A left
	if Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT
	# D right
	if Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT
	
	# Movement calc
	move_and_slide(direction.normalized() * (speed*125) * delta)
	
	# Noise 0 calc
	if direction == Vector2.ZERO:
		noise = 0
		
	# Debug label
	if GlobalData.debug:
		get_node("Debug/Mass").text = "Mass: " + str(Mass)
		get_node("Debug/Speed").text = "Speed: " + str(speed)
		get_node("Debug/Noise").text = "Noise: " + str(noise)
		get_node("Debug/Direction").text = "Direction: " + str(direction)
		get_node("Debug/FPS").text = "FPS: " + str(Engine.get_frames_per_second())
		get_node("Debug/Proc_phisics").text = "Proc_phisics: " + str(get_physics_process_delta_time())
		get_node("Debug/Process").text = "Process: " + str(get_process_delta_time())

	
