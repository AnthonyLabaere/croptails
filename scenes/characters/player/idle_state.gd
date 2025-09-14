class_name IdleState
extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	animated_sprite_2d.play(player.get_animation("idle"))
	

func _on_next_transitions() -> void:
	GameInputEvent.movement_input()
	
	if GameInputEvent.is_movement_input():
		transition.emit("Walk")
	
	if GameInputEvent.use_tool():
		if player.current_tool == DataTypes.Tools.AxeWood:
			transition.emit("Chopping")
		if player.current_tool == DataTypes.Tools.TillGround:
			transition.emit("Tilling")
		if player.current_tool == DataTypes.Tools.WaterCrops:
			transition.emit("Watering")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
