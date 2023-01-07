extends KinematicBody2D


#movement variables
export var movementSpeed:float = 4.7
var _velocity:= Vector2.ZERO

#animations
onready var _animator: AnimationPlayer = $PlayerAnimation
onready var _pivot: Node2D = $Player
onready var _scale: Vector2 = _pivot.scale


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta:float) -> void:
	var _horizontalDirection = (
		Input.get_action_strength("move_left")
		- Input.get_action_strength("move_right")
		)
	var _verticalDirection = (
		Input.get_action_strength("move_up")
		- Input.get_action_strength("move_down")
		)	
	_velocity.x = _horizontalDirection * movementSpeed
	_velocity.y = _verticalDirection * movementSpeed
	var isWalking := _velocity.x or _velocity.y > 0.1
	animationCheck(_animator)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func animationCheck(_animator):
	if Input.is_action_pressed("move_left"):
		_animator.play("walk_left")
	if Input.is_action_pressed("move_right"):
		_animator.play("walk_right")
	if Input.is_action_pressed("move_up"):
		_animator.play("walk_back")
	if Input.is_action_pressed("move_down"):
		_animator.play("Walk")
	