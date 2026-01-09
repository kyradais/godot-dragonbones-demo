extends Node2D

@onready var armature :DragonBonesArmatureView = $Object
@onready var icon_node :Node2D = $Icon

func _ready() -> void:
	armature.debug = true
	armature.current_animation = "bone_root_rotation"

func _process(delta: float) -> void:
	var slot := armature.global_position + armature.get_bone("bone_tail").position
	print(armature.get_bone("bone_root").get_parent().get_name())
