extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var velocity = Vector2(0, 50)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_physics_process(true)
	pass

func _physics_process(delta):
    # check if disabled/visible, if not
    # move downwards
    # shoot bullets
    if get_node("Sprite").visible == true:
        var collision = move_and_collide(velocity * delta)
        if collision:
	        # Means the monster collided with Paddle
            velocity = Vector2(0,0)
            get_tree().change_scene("res://Scenes/Gameover.tscn")

    pass
