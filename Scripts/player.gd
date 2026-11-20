extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var camera: Camera2D = $Camera2D
@onready var label = %Label
@onready var fruit = preload("res://Scenes/fruit.tscn")
@rpc("authority", "call_local", "reliable")


func teleporter_vers(nouvelle_position: Vector2) -> void:
	global_position = nouvelle_position
	velocity = Vector2.ZERO
	
func _enter_tree() -> void:
	set_multiplayer_authority(int(str(name)))
	var label := Label.new()
	label.text = $UI/Multiplayer/VBoxContainer/Nom.text
	label.position = Vector2(0, 0)
	add_child(label)


func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		$AnimatedSprite2D2.modulate = Color.SKY_BLUE
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D2.play("idle")
		
	if direction == 1 :
		$AnimatedSprite2D2.flip_h = false
		$AnimatedSprite2D2.play("run")
		
	if direction == -1 :
		$AnimatedSprite2D2.flip_h = true
		$AnimatedSprite2D2.play("run")
		
	move_and_slide()
	
func _ready() -> void:
	print("Joueur : ", name, " | Mon ID : ", multiplayer.get_unique_id(), " | Autorité : ", get_multiplayer_authority())
	if is_multiplayer_authority():
		camera.enabled = true
		camera.make_current()
	else:
		# Désactive explicitement la caméra pour les autres joueurs
		camera.enabled = false
		
	
	
