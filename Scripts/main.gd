extends Node3D
var last_platform = 23
var crystal := preload("res://Scenes/Crystals.tscn")
var speed_powerup := preload("res://Scenes/Speed_powerup.tscn")
var jump_powerup := preload("res://Scenes/jump_powerup.tscn")
var platform := preload("res://Platform.tscn")
var killer1 := preload("res://Scenes/killer.tscn")
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3
@onready var timer_4: Timer = $Timer4
@onready var player: CharacterBody3D = $Player
@onready var dead_screen: CanvasLayer = $Dead


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(spawning_crystal)
	timer_2.timeout.connect(spawning_speedpowerup)
	timer_3.timeout.connect(spawning_jumppowerup)
	spawning_platform()
	timer.timeout.connect(spawning_platform)
	dead_screen.hide()
	timer_4.timeout.connect(spawning_killers)
	
	if dead_screen:
		dead_screen.process_mode = Node.PROCESS_MODE_ALWAYS
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.Dead == true:
		dead()
func spawning_crystal() -> void :
	var lane = (randi_range(0,3) - 1.5) * 2
	for i in 9:
		var crystal_instance = crystal.instantiate()
		add_child(crystal_instance)
		crystal_instance.global_position = Vector3(lane,1.1,player.global_position.z+20+i)
func spawning_speedpowerup() -> void :
	var speed_powerup_instance = speed_powerup.instantiate()
	add_child(speed_powerup_instance)
	var lane = (randi_range(0,3) - 1.5) * 2
	speed_powerup_instance.global_position = Vector3(lane,1.1,player.global_position.z+20)
func spawning_jumppowerup() -> void :
	var jump_powerup_instance = jump_powerup.instantiate()
	add_child(jump_powerup_instance)
	var lane = (randi_range(0,3) - 1.5) * 2
	jump_powerup_instance.global_position = Vector3(lane,1.1,player.global_position.z+20)
func spawning_killers() -> void :
	var killer_instance = killer1.instantiate()
	add_child(killer_instance)
	var lane = (randi_range(0,3) - 1.5) * 2
	killer_instance.global_position = Vector3(lane,0,player.global_position.z+20)
func spawning_platform():
	for i in 3:
		last_platform +=23
		var platform_instance = platform.instantiate()
		add_child(platform_instance)
		platform_instance.global_position = Vector3(0,0,last_platform)
func dead():
	Globals.Dead = false
	dead_screen.show()
	get_tree().paused = true
	
