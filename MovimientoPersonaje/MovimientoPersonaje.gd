extends CharacterBody2D

const SPEED = 200
const JUMPSPEDD = -650

func _physics_process(delta:float) ->void:
	#Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta
	#Mov Horizontal
	if Input.is_action_pressed("Izq"):
		velocity.x -= SPEED		
		
	elif Input.is_action_pressed("Der"):
		velocity.x += SPEED
	else:
		velocity.x = 0
	#Salto
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y += JUMPSPEDD
	#RockFall
	if not is_on_floor() and Input.is_action_pressed("Shift"):
		velocity += (get_gravity() * delta) * 2
		velocity.x = 0
		if(is_on_floor and Input.is_action_just_released("Shift")):
			velocity += get_gravity() * delta	
	move_and_slide()

			
		
	
		
	
		
	
	
