extends Node2D

@onready var armature :DragonBonesArmatureView = $Object
@onready var icon_node :Node2D = $Icon

func _ready() -> void:
	armature.debug = true
	armature.current_animation = "bone_tail_rotation"
	print(armature.get_bone("bone_tail").global_position)

func _process(delta: float) -> void:
	icon_node.global_transform = DragonBonesGTransform.get_bone_global_transform(armature,"bone_tail", Vector2(0,0), float(90))
	print(icon_node.global_transform)
