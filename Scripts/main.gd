extends Node3D
var crystal := preload("res://Scenes/Crystals.tscn")
var speed_powerup := preload("res://Scenes/Speed_powerup.tscn")
var jump_powerup := preload("res://Scenes/jump_powerup.tscn")

@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3
@onready var player: CharacterBody3D = $Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(spawning_crystal)
	timer_2.timeout.connect(spawning_speedpowerup)
	timer_3.timeout.connect(spawning_jumppowerup)

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
func spawning_jumppowerup() -> void :
	var jump_powerup_instance = jump_powerup.instantiate()
	add_child(jump_powerup_instance)
	var lane = (randi_range(0,3) - 1.5) * 2
	jump_powerup_instance.global_position = Vector3(lane,1.1,player.global_position.z+5)
