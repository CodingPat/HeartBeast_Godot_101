extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const ball_scene=preload("res://Ball.tscn")
var score=0 setget set_score

# Called when the node enters the scene tree for the first time.
func _ready():
	var rect=get_viewport_rect()
	get_viewport().warp_mouse(Vector2(rect.size.x/2,rect.size.y-100))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			var ball=ball_scene.instance()	
			get_tree().get_root().add_child(ball)
			
			
func set_score(value):
	score=value
	get_node("Score").text="Score: "+str(score)
	