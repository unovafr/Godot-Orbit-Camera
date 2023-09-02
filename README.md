# Godot Orbit Camera

This plugin adds an OrbitCamera node in the Godot Editor.

# Usage

## In the Editor
1. Enable OrbitCamera plugin in Project Settings > Plugins
2. Add Node3D node (used for rotating the camera) into current scene
3. Add OrbitCamera as a child of the Node3D node
4. Set *Anchor Node* property of OrbitCamera to the Node3D node

## Controls (Mouse)
- Hold Left Mouse Button to orbit around the *Anchor Node*
- Mouse scroll wheel to change the distance to *Anchor Node*

## Controls (Touch)
- Single touch drag to orbit around the *Anchor Node*
- Pinch gesture to change the distance to *Anchor Node*
