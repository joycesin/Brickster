extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var screensize
export (int) var speed = 400  # How fast the player will move (pixels/sec).
var paddleWidth
var paddleHeight

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
    set_physics_process(true)
    screensize = get_viewport_rect().size
    print("test ", get_node('/root/World/Paddle/Sprite'))
    var spriteVar = get_node('/root/World/Paddle/Sprite')
    pass

func _physics_process(delta):
    var velocity = Vector2()
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
    position += velocity * delta
    position.x = clamp(position.x, 80, screensize.x - 80)
    position.y = clamp(position.y, 0.5 * screensize.y, screensize.y - 14)
    pass

