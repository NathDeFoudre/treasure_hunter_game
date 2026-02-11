extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -330.0
var coin_earn = 0

func _ready() -> void:
	global.player_node = self

func tambah_score():
	coin_earn += 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("lompat") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("jalan_kiri", "jalan_kanan")
	if direction:
		$AnimatedSprite2D.flip_h = direction < 0
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if not is_on_floor():
		$AnimatedSprite2D.play("roll")
	elif direction != 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
	move_and_slide()
