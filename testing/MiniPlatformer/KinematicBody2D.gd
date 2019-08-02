extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const UP=Vector2(0,-1)
const GRAVITY=20
const ACCELERATION=20
const MAX_SPEED=300
const JUMP_HEIGHT=-600

var motion=Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	motion.y+=GRAVITY
	var friction=false
	
	if Input.is_action_pressed("ui_right"):
		motion.x=min(motion.x+ACCELERATION,MAX_SPEED)
		$Sprite.play("run")
		$Sprite.flip_h=false
	elif Input.is_action_pressed("ui_left"):
		motion.x=max(motion.x-ACCELERATION,-MAX_SPEED)
		$Sprite.play("run")
		$Sprite.flip_h=true
	else:
		friction=true
		$Sprite.play("idle")
		
	if is_on_floor():
		
		if Input.is_action_pressed("ui_up"):
			motion.y+=JUMP_HEIGHT
		if friction:
			motion.x=lerp(motion.x,0,0.20)
			
	else:
		if motion.y<0:
			$Sprite.play("jump")
		else: 
			$Sprite.play("fall")
		if friction:
			motion.x=lerp(motion.x,0,0.05)
		
	motion=move_and_slide(motion,UP)
	