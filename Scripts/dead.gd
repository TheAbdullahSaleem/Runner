extends CanvasLayer
@export var menu : CanvasLayer
@export var main : Node3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Globals.restart = true


func _on_button_2_pressed() -> void:
	main.get_tree().paused = true
	self.hide()
	Globals.menu = true
