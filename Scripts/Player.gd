extends CharacterBody3D
@onready var anim_tree: AnimationTree = $RUN_GUY_V1/AnimationTree
enum {IDLE,RUN,JUMP,FALL}
var current_anim = IDLE
var cur_lane = 0
var lane_width = 2
var run_val = 0
var jump_val = 0
var fall_val = 0
var blend_speed = 5
var run_anim_speed = 1.5
@export var speed : float = 3
@export var jump : int = 5
@export var boosted_jump : float = 10

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
	speed += 0.0001
	run_anim_speed += 0.0001
	Globals.distance_covered = position.z
	Globals.player_speed = snapped(velocity.z,0.1)
	if is_on_floor():
		current_anim = RUN
	var target_x = (cur_lane - 1.5) * lane_width
	velocity.x = (target_x - position.x) * delta *200
	update_tree()
	handle_anim(delta)
	if not is_on_floor():
		velocity.y -= 9.8*delta
		if velocity.y < 0:
			current_anim = FALL
	if Input.is_action_just_pressed("right"):
		cur_lane = max(cur_lane - 1 , 0)
	if Input.is_action_just_pressed("left"):
		cur_lane = min(cur_lane + 1 , 3)
	if velocity == Vector3.ZERO:
		current_anim =IDLE

	if Globals.speed_powerup:
		velocity.z = speed*1.5
		anim_tree.set("parameters/TimeScale/scale",run_anim_speed*1.5)
		Globals.speed_powerup_timer -= delta

	if Globals.speed_powerup_timer <= 0.2:
		Globals.speed_powerup = false
		anim_tree.set("parameters/TimeScale/scale",run_anim_speed)
		velocity.z = speed

	if Input.is_action_just_pressed("jump") and is_on_floor():
		if Globals.jump_powerup:
			velocity.y = boosted_jump
			Globals.jump_powerup_timer -= delta

		if Globals.jump_powerup_timer <= 0.2:
			Globals.jump_powerup = false
			velocity.y = jump
		current_anim = JUMP

	move_and_slide()
