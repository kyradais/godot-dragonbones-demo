extends Node2D

@onready var armature :DragonBonesArmatureView = $Object

func _ready() -> void:
	armature.debug = true
	var a = armature.get_armature()
	armature.current_animation	= "bone_armtail_rotation"
	print("This is :", a)	

func _process(delta: float) -> void:
	var a = armature.get_bone("bone_tail")
	print("That is :", a.rotation)
