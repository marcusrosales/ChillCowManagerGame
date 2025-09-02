extends CharacterBody3D

@export var Animal: Animals
@export var RoamRegion: NavigationRegion3D
@onready var CowBrain = $NavigationAgent3D

# Pick a random spot to walk to and tell the AI to go there
func getTempPoint():
	var TempPosition := Vector3.ZERO  # Start at (0,0,0)
	TempPosition.x = randf_range(-5.0, 5.0)  # Pick a random X
	TempPosition.z = randf_range(-5.0, 5.0)  # Pick a random Z
	CowBrain.set_target_position(TempPosition)  # Tell the agent to move there

func _ready():
	getTempPoint()  # Pick the first random spot when the game starts

func _physics_process(delta):
	var Destination = CowBrain.get_next_path_position()  # Figure out the next step toward the target
	var Distance = Destination - global_position  # Get the direction to go
	
	velocity = Distance * Animal.speed * delta  # Turn direction into movement
	move_and_slide()  # Actually move the enemy, handling collisions
