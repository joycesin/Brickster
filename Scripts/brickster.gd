extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_physics_process(true)
	pass

func _physics_process(delta):
    var bodies = get_colliding_bodies()
    for body in bodies:
        if body.is_in_group("Ball"):
            print("Collided with ball")
            get_node("collision").disabled = true;
            get_node("Sprite").visible = false;
            get_node("monster/CollisionShape2D").disabled = false;
            get_node("monster/Sprite").visible = true;
