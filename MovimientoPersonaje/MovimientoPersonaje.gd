extends CharacterBody2D

const SPEED = 200
const SPRINTING = 400
const JUMPSPEDD = -650
@onready var personajeMain = $AnimatedSprite2D

var dentro_del_area = false

func _ready():
	personajeMain.sprite_frames.set_animation_on_loop_mode("dying", SpriteFrames.LoopMode.LOOP_NONE)

func _physics_process(delta:float) ->void:
	move_and_slide()
	#Movimiento
	#Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta
	#MOVIMIENTO H 
	if Input.is_action_pressed("Izq"):
		velocity.x = -SPEED
	
		if Input.is_action_pressed("Mayus"):
			velocity.x = -SPRINTING

	elif Input.is_action_pressed("Der"):
		velocity.x = SPEED
	
		if Input.is_action_pressed("Mayus"):
			velocity.x = SPRINTING

	else:
		velocity.x = 0

	#Salto
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y += JUMPSPEDD
	
	
	
	#RockFall
	if not is_on_floor() and Input.is_action_pressed("Shift"):
		velocity += (get_gravity() * delta) * 2
		velocity.x = 0
		if(is_on_floor() and Input.is_action_just_released("Shift")):
			velocity += get_gravity() * delta	
	
	
	
	
func on_area_muerte_entered(body: Node2D) -> void:
		dentro_del_area = true
		
	#Aninmaciones
func _process(delta):
	#Andar izq y der
	if(velocity.x > 0):
		personajeMain.play("walking")
		personajeMain.flip_h = false
	elif(velocity.x < 0):		
		personajeMain.play("walking")
		personajeMain.flip_h = true
	#Correr horizontalmente
	if(velocity.x > 200):
		personajeMain.play("sprinting")
		personajeMain.flip_h = false
	elif(velocity.x < -200):
		personajeMain.play("sprinting")
		personajeMain.flip_h = true
	#Saltar
	if not is_on_floor():
		personajeMain.play("jumping")
	#Idle
	if(velocity == Vector2(0,0)):
		personajeMain.play("idle")
	#Dying
	if(dentro_del_area):
		personajeMain.play("dying")
		
	
	
