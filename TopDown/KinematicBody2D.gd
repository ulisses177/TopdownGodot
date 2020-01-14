extends KinematicBody2D

# Declare member variables here. Examples:
var motion = Vector2()
var tile_offset = 1
var current_tile = tile_offset
var moving = false
var my_time1 = 0.0
var sync_time1 = false

# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func _switch_sprites(current_frame, now_tile_offset, synctime1):
	if synctime1:
		current_frame += 1
		if current_frame > now_tile_offset + 1 : 
			current_frame = current_frame-2
	print ("switching sprites")
	return current_frame+now_tile_offset
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#time sync
	my_time1 += delta
	if my_time1 > 0.7:
		my_time1 = 0.0
		sync_time1 = !sync_time1
		
	
	#motion tick Section
	moving = false
	motion = Vector2 (0,0)
	if Input.is_action_pressed("ui_up"):
		motion.y += -160
		moving = true
	if Input.is_action_pressed("ui_down"):
		motion.y += 160
		moving = true
	if Input.is_action_pressed("ui_left"):
		motion.x += -160
		moving = true
	if Input.is_action_pressed("ui_right"):
		motion.x += 160
		moving = true
	move_and_slide(motion)
	#animation tick section
	
	
	if Input.is_action_pressed("ui_up"):
		current_tile = tile_offset
		current_tile = _switch_sprites(current_tile, tile_offset+35,sync_time1)
	if Input.is_action_pressed("ui_down"):
		current_tile = tile_offset
		current_tile = _switch_sprites(current_tile, tile_offset-1,sync_time1)
	if Input.is_action_pressed("ui_left"):
		current_tile = tile_offset
		current_tile = _switch_sprites(current_tile, tile_offset+11,sync_time1)
	if Input.is_action_pressed("ui_right"):
		current_tile = tile_offset
		current_tile = _switch_sprites(current_tile, tile_offset+23,sync_time1)
	$Sprite.frame = current_tile
	
	
	
	#current_tile = $TileMap.
	
	
	
		
	pass
