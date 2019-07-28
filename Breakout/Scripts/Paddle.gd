extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var y

# Called when the node enters the scene tree for the first time.
func _ready():
	y=position.y
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_x=get_viewport().get_mouse_position().x
	position=Vector2(mouse_x,y)
