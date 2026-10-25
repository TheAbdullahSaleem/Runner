extends Node
var crystals = 0
var speed_powerup : bool = false
var speed_powerup_timer := 0.0
var player_speed : float
var distance_covered : int = 0
@export var boost_durtion : float = 30.0
var jump_powerup : bool = false
var jump_powerup_timer := 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func activate_speedpup():
	speed_powerup = true
	speed_powerup_timer = boost_durtion
func activate_jumppup():
	jump_powerup = true
	jump_powerup_timer = boost_durtion
