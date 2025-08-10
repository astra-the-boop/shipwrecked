extends Node2D


var shipRotation = 0
var aaaa = 0
var bb = false
var rotationFromIsland = 0
var distanceFromIsland = 0 #idfk 100 = yer dead

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _input(event):
	if event.is_action_pressed("asdf"):
		bb = !bb
	if event.is_action_pressed("patch"):
		aaaa = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	distanceFromIsland += 0.05
	aaaa += 0.02
	$"Image(1)".visible = bb
	print("sdklafj", aaaa)
	if aaaa >= 10:
		$"Image(1)/Border".visible = true
	else:
		$"Image(1)/Border".visible = false

	if aaaa >= 50:
		get_tree().change_scene_to_file("res://dead.tscn")
	
	$ImageBackgroundRemoved.scale.x = 0.676 * distanceFromIsland / 10
	$ImageBackgroundRemoved.scale.y = 0.714 * distanceFromIsland / 10

	# Death condition
	if distanceFromIsland > 100:
		print("Checking death range:", rotationFromIsland)


		if rotationFromIsland > -500 and rotationFromIsland < 3200:
			print("You died")
			get_tree().change_scene_to_file("res://dead.tscn")
			return 


		$ImageBackgroundRemoved.scale = Vector2(0.676, 0.714)
		rotationFromIsland = 0
		distanceFromIsland = 0
		$ImageBackgroundRemoved.position.x = 2183


	$"321434".rotation_degrees = shipRotation * 10
	$"306629-200".rotation_degrees = shipRotation /10


	$ImageBackgroundRemoved.position.x = -rotationFromIsland * 2.5 + 2183
	$ImageBackgroundRemoved.visible = $ImageBackgroundRemoved.position.x >= 1200


	if Input.is_action_pressed("turnSteeringWheelLeft"):
		shipRotation -= 0.5
		rotationFromIsland -= 0.5
	if Input.is_action_pressed("turnSteeringWheelRight"):
		shipRotation += 0.5
		rotationFromIsland += 0.5

		
	$"321434".rotation_degrees = shipRotation * 10
	$"306629-200".rotation_degrees = shipRotation / 10
	$ImageBackgroundRemoved.position.x = -rotationFromIsland*2.5 + 2183
	if($ImageBackgroundRemoved.position.x < 1200):
		$ImageBackgroundRemoved.visible = false
	else:
		$ImageBackgroundRemoved.visible = true
	#print($ImageBackgroundRemoved.position.x)
	#print(distanceFromIsland)
	if Input.is_action_pressed("turnSteeringWheelLeft"):
		shipRotation -= 0.5
		rotationFromIsland -= 0.5
	if Input.is_action_pressed("turnSteeringWheelRight"):
		shipRotation += 0.5
		rotationFromIsland += 0.5
