tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("OrbitCamera", "Camera", preload("res://addons/orbit_camera/orbit_camera.gd"), preload("res://addons/orbit_camera/orbit_camera_icon.svg"))

func _exit_tree():
	remove_custom_type("OrbitCamera")
