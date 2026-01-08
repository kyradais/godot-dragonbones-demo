extends Node2D

@onready var armature :DragonBonesArmatureView = $Object

func _ready() -> void:
	armature.debug = true
	var a = armature.get_armature()
	print("This is :", a)	

func _process(delta: float) -> void:
	var a = armature.get_armature()
	print("That is :", a)	
