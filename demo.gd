extends Node2D

@onready var armature :DragonBonesArmatureView = $Object
@onready var icon_node :Node2D = $Icon

func _ready() -> void:
	armature.debug = true
	armature.current_animation = "bone_armtail_rotation"

func _process(delta: float) -> void:
	icon_node.global_position = armature.get_bone("bone_tail").global_position
	icon_node.global_rotation = get_bone_global_rotation("bone_tail", 90)
		
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
