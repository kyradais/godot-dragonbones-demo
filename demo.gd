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
		
func get_bone_global_position(bon_name: String, vector2Offset: Vector2) -> Vector2:
	var finalPosition = armature.get_bone(bon_name).global_position + vector2Offset
	return finalPosition
	
func get_bone_global_rotation(bone_name: String, degreOffset: float) -> float:
	var final_rad: float = 0.0
	var current_name = bone_name
	while true:
		var bone = armature.get_bone(current_name)
		final_rad += bone.global_rotation
		if bone.get_parent():
			current_name = bone.get_parent().get_name()
		else:
			break
	final_rad += deg_to_rad(degreOffset)
	return final_rad

func get_bone_global_transform(
	bone_name: String,
	position_offset: Vector2 = Vector2.ZERO,
	rotation_offset_deg: float = 0.0
) -> Transform2D:

	var final_rad: float = 0.0
	var current_name := bone_name

	while true:
		var bone = armature.get_bone(current_name)
		final_rad += bone.global_rotation

		if bone.get_parent():
			current_name = bone.get_parent().get_name()
		else:
			break

	final_rad += deg_to_rad(rotation_offset_deg)

	var origin := armature.get_bone(bone_name).global_position + position_offset

	return Transform2D(final_rad, origin)

#func getBoneGlobalRotation(boneName: String) -> float:
	#var nullRoot:bool = false
	#var eachBoneRad: Array[float] = []
	#var finalRad: float
	#var currentName = boneName
	#
	#while !nullRoot:		
		#eachBoneRad.append(armature.get_bone(currentName).global_rotation)
		#if armature.get_bone(currentName).get_parent():
			#currentName = armature.get_bone(currentName).get_parent().get_name()
		#else:
			#nullRoot = true
	#
	#return finalRad
