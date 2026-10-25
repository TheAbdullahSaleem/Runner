extends Node3D
const crystal := preload("res://Scenes/Crystals.tscn")
@onready var timer: Timer = $Timer
@onready var player: CharacterBody3D = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(spawning_crystal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func spawning_crystal() -> void :
	var crystal_instance = crystal.instantiate()
	add_child(crystal_instance)
	crystal_instance.global_position = Vector3(randi_range(-2,1),1.1,player.global_position.z+10)
	print("added")
