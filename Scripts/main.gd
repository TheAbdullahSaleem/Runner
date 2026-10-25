extends Node3D
var crystal := preload("res://Scenes/Crystals.tscn")
var speed_powerup := preload("res://Scenes/Speed_powerup.tscn")
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var player: CharacterBody3D = $Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(spawning_crystal)
	timer_2.timeout.connect(spawning_speedpowerup)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func spawning_crystal() -> void :
	var lane = (randi_range(0,3) - 1.5) * 2
	for i in 9:
		var crystal_instance = crystal.instantiate()
		add_child(crystal_instance)
		crystal_instance.global_position = Vector3(lane,1.1,player.global_position.z+5+i)
func spawning_speedpowerup() -> void :
	var speed_powerup_instance = speed_powerup.instantiate()
	add_child(speed_powerup_instance)
	var lane = (randi_range(0,3) - 1.5) * 2
	speed_powerup_instance.global_position = Vector3(lane,1.1,player.global_position.z+5)
