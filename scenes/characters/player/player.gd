class_name Player
extends CharacterBody2D

@onready var hit_component: HitComponent = $HitComponent

@export var current_tool: DataTypes.Tools = DataTypes.Tools.None

var player_direction: Vector2

func _ready() -> void:
	ToolManager.tool_selected.connect(on_tool_selected)
	
func on_tool_selected(tool: DataTypes.Tools) -> void:
	current_tool = tool
	hit_component.current_tool = tool
	#print("Tool : ", tool)

func get_animation(animation_type: String) -> String:
	if player_direction == Vector2.LEFT:
		return animation_type + "_left"
	elif player_direction == Vector2.RIGHT:
		return animation_type + "_right"
	elif player_direction == Vector2.UP:
		return animation_type + "_back"
	elif player_direction == Vector2.DOWN:
		return animation_type + "_front"
	else:
		return animation_type + "_front"
