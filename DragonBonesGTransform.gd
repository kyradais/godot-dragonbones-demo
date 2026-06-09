class_name DragonBonesGTransform
extends RefCounted

static func get_bone_global_position(armature :DragonBonesArmatureView, bon_name: String, vector2Offset: Vector2) -> Vector2:
	var finalPosition = armature.get_bone(bon_name).global_position + vector2Offset
	return finalPosition
	
static func get_bone_global_rotation(armature :DragonBonesArmatureView, bone_name: String, degreOffset: float) -> float:
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

static func get_bone_global_transform(
	armature :DragonBonesArmatureView,
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
