extends CharacterBody2D

const SPEED = 200
const JUMPSPEDD = -650
@onready var personajeMain = $AnimatedSprite2D

var dentro_del_area = false

func _ready():
	personajeMain.sprite_frames.set_animation_on_loop_mode("dying", SpriteFrames.LoopMode.LOOP_NONE)

func _physics_process(delta:float) ->void:
	
	#Movimiento
	#Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#Mov Horizontal
	if Input.is_action_pressed("Izq"):
		velocity.x -= SPEED
		personajeMain.play("walking")
		
	elif Input.is_action_pressed("Der"):
		velocity.x += SPEED
		personajeMain.play("walking")
	else:
		velocity.x = 0
		personajeMain.play("idle")
	
	#Salto
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y += JUMPSPEDD
		personajeMain.play("jumping")
	
	#Sprint
	if(Input.is.action_pressed(""))
	
	#RockFall
	if not is_on_floor() and Input.is_action_pressed("Shift"):
		velocity += (get_gravity() * delta) * 2
		velocity.x = 0
		if(is_on_floor and Input.is_action_just_released("Shift")):
			velocity += get_gravity() * delta	
	#Animaciones 
	
	#Que el sprite tome la direccion al lado que se mueva 
	if(direction < 0):
		personaje.flip_h = false
	elif(direction > 0):
		personaje.flip_h = true
	move_and_slide()
	
	func on_area_muerte_entered(body: Node2D) -> void:
		
		print = body.name
		dentro_del_area = true
		
	
func _process(delta):
	ready
			

			
		
	
		
	
		
	
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if personajeMain.animation == "die":
		print("La ha palmao")
		get_tree().quit()
			void quit(exit_code: int = 0)
