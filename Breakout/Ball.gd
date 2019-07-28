extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEEDUP=10
const MAXSPEED=500

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	set_linear_velocity(Vector2(0,200))
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collided_bodies=get_colliding_bodies()
	for body in collided_bodies:
		if body.is_in_group("Bricks"):
			body.queue_free()
			get_node("/root/World").score+=5
		if body.get_name()=="Paddle":
			var speed=get_linear_velocity().length()#magnitude
			var direction=position-body.get_node("Anchor").get_global_position()
			var newspeed=direction.normalized()*min(speed+SPEEDUP,MAXSPEED)
			set_linear_velocity(newspeed)
	
	#delete ball node if outside screen
	if position.y>get_viewport().size.y:
		queue_free()
		 
