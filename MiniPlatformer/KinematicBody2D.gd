extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion=Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	motion.y+=1
	if Input.is_action_pressed("ui_right"):
		motion.x=100
	elif Input.is_action_pressed("ui_left"):
		motion.x=-100
	else:
		motion.x=0
		
	move_and_slide(motion)
	