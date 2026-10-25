extends CharacterBody3D
@onready var anim_tree: AnimationTree = $RUN_GUY_V1/AnimationTree
enum {IDLE,RUN,JUMP,FALL}
var current_anim = IDLE

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var run_val = 0
var jump_val = 0
var fall_val = 0
var blend_speed = 5

func handle_anim(delta):
	match current_anim:
		IDLE:
			run_val = lerpf(run_val,0,blend_speed*delta)
			jump_val = lerpf(jump_val,0,blend_speed*delta)
			fall_val = lerpf(fall_val,0,blend_speed*delta)
		RUN:
			run_val = lerpf(run_val,1,blend_speed*delta)
			jump_val = lerpf(jump_val,0,blend_speed*delta)
			fall_val = lerpf(fall_val,0,blend_speed*delta)
		JUMP:
			run_val = lerpf(run_val,0,blend_speed*delta)
			jump_val = lerpf(jump_val,1,blend_speed*delta)
			fall_val = lerpf(fall_val,0,blend_speed*delta)
		FALL:
			run_val = lerpf(run_val,0,blend_speed*delta)
			jump_val = lerpf(jump_val,0,blend_speed*delta)
			fall_val = lerpf(fall_val,1,blend_speed*delta)

func update_tree():
	anim_tree["parameters/run/blend_amount"] = run_val
	anim_tree["parameters/jump/blend_amount"] = jump_val
	anim_tree["parameters/fall/blend_amount"] = fall_val

func _physics_process(delta: float) -> void:
	update_tree()
	handle_anim(delta)
	if not is_on_floor():
		current_anim = FALL
		velocity.y = -5
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = move_toward(position.y,10,delta)
	if velocity == Vector3.ZERO:
		current_anim =IDLE
	move_and_slide()
