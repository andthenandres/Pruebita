extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("juices")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("Der")):
		print("Has pulsado derecha")
	if(Input.is_action_just_pressed("Izq")):
		print("Has pulsado izquierda")
	if(Input.is_action_just_pressed("Izq")):
		print("Pulsa")
	if(!Input.is_action_just_pressed("Izq")):
		print("No Pulsa")
		
		
#Movimiento
	
func physics_process(delta:float) -> void:
	#if(!.is_on_floor):
		#velocity		
	ready
