extends CanvasLayer
@onready var label: Label = $Control/Label
@onready var label_2: Label = $Control/Label2
@onready var label_3: Label = $Control/Label3
@onready var label_4: Label = $Control/Label4
@onready var label_5: Label = $Control/Label5
@onready var pause_screen: CanvasLayer = $"../pause_screen"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "Crystals: " + str(Globals.crystals)
	label_2.text = "Speed: " + str(Globals.player_speed)
	label_3.text = "Distance Covered: " + str(Globals.distance_covered)
	if Globals.jump_powerup_timer > 0.3:
		label_4.text = "Jump powerup Remaining Time: " + str(snapped(Globals.jump_powerup_timer,0.1))
	else:
		label_4.text = "" 
	if Globals.speed_powerup_timer > 0.3:
		label_5.text = "Speed powerup Remaining Time: " + str(snapped(Globals.speed_powerup_timer,0.1))
	else:
		label_5.text = ""
func _on_button_pressed() -> void:
		Globals.pause = true
		pause_screen.show()
		get_tree().paused = true
