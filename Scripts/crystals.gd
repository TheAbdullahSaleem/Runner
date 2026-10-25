extends Area3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween().set_loops()
	var target_rotation = Vector3(0,TAU,0)
	tween.tween_property(self,"rotation",target_rotation,1.5).from(Vector3.ZERO)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		Globals.crystals += 1
		queue_free()
