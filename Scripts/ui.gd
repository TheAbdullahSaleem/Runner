extends CanvasLayer
@onready var label: Label = $Control/Label
@onready var label_2: Label = $Control/Label2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "Crystals: " + str(Globals.crystals)
	label_2.text = "Speed: " + str(Globals.player_speed)
