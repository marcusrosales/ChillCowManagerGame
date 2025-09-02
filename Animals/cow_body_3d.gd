extends CharacterBody3D
@onready var CowBrain = $NavigationAgent3D
@export var RoamRegion: NavigationRegion3D

var speed = 50
var health = 100

func getRandomPoint():
	var random_pos := Vector3.ZERO
	random_pos.x = randf_range(-5.0,5.0)
	random_pos.z = randf_range(-5.0,5.0)
	CowBrain.set_target_position(random_pos)

func _ready():
	getRandomPoint()

func _physics_process(delta):
	var destination = CowBrain.get_next_path_position()
	var local_des = destination- global_position
	var direction = local_des
	
	velocity = direction * speed * delta
	
	move_and_slide()
