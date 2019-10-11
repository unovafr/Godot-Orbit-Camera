extends Camera

class_name OrbitCamera

# External var
export var SCROLL_SPEED:float = 10
export var DEFAULT_DISTANCE:float = 20
export var ROTATE_SPEED: float = 10
export var ANCHOR_NODE_PATH: NodePath

# Event var
var _move_speed: Vector2
var _scroll_speed: int

# Transform var
var _rotation: Vector3
var _distance: float
var _anchor_node: Spatial

func _ready():
	_rotation = self.transform.basis.get_rotation_quat().get_euler()
	_distance = DEFAULT_DISTANCE
	_anchor_node = self.get_node(ANCHOR_NODE_PATH) as Spatial
	pass

func _process(delta: float):
	_process_transformation(delta)
	pass

func _process_transformation(delta: float):
	# Update rotation
	_rotation.x += -_move_speed.y * delta * ROTATE_SPEED
	_rotation.y += -_move_speed.x * delta * ROTATE_SPEED
	if _rotation.x < -PI/2:
		_rotation.x = -PI/2
	if _rotation.x > PI/2:
		_rotation.x = PI/2
	_move_speed = Vector2()
	
	# Update distance
	_distance += _scroll_speed * delta
	if _distance < 0:
		_distance = 0
	_scroll_speed = 0
	
	self.set_identity()
	self.translate_object_local(Vector3(0,0,_distance))
	_anchor_node.set_identity()
	var t = Quat()
	t.set_euler(_rotation);
	_anchor_node.transform.basis = Basis(t)
	pass

func _unhandled_input(event):
	if event is InputEventScreenDrag:
		_process_touch_rotation_event(event)
	elif event is InputEventMouseMotion:
		_process_mouse_rotation_event(event)
	elif event is InputEventMouseButton:
		_process_mouse_scroll_event(event)
	pass

func _process_mouse_rotation_event(e: InputEventMouseMotion):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		_move_speed = e.relative
	pass

func _process_mouse_scroll_event(e: InputEventMouseButton):
	if e.button_index == BUTTON_WHEEL_UP:
		_scroll_speed = -1 * SCROLL_SPEED
	elif e.button_index == BUTTON_WHEEL_DOWN:
		_scroll_speed = 1 * SCROLL_SPEED
	pass

func _process_touch_rotation_event(e: InputEventScreenDrag):
	_move_speed = e.relative
	pass
