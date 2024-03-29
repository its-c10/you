extends CharacterBody2D

@export var acceleration: int = 20
@export var max_speed: int = 100

var speed: int = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var is_moving_left: bool = Input.is_action_pressed("player_move_left")
	var is_moving_right: bool = Input.is_action_pressed("player_move_right")
	if is_moving_right:
		speed += acceleration
		velocity.x += speed
	if is_moving_left: 
		speed -= acceleration
		velocity.x -= speed
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$Sprite.play()
	else:
		$Sprite.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, get_viewport_rect().size)
	
	
