extends Node2D

@onready var armature :DragonBonesArmatureView = $Object
@onready var icon_node :Node2D = $Icon

func _ready() -> void:
	armature.debug = true
	armature.current_animation = "bone_armtail_rotation"

func _process(delta: float) -> void:
	var bone_root := armature.get_bone("bone_root")
	var bone_tail := armature.get_bone("bone_tail")
	
	
	icon_node.transform = bone_root.global_transform * bone_tail.transform
