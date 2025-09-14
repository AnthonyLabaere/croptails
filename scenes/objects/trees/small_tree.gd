extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var log_scene = preload("res://scenes/objects/trees/log.tscn")


func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damaged_reached.connect(on_max_damaged_reached)
	
	
func on_hurt(hit_damage: int) -> void:
	damage_component.apply_damage(hit_damage)
	material.set_shader_parameter("shake_intensity", 0.5)
	await get_tree().create_timer(1.0).timeout
	material.set_shader_parameter("shake_intensity", 0.0)
	
	
func on_max_damaged_reached() -> void:
	call_deferred("add_log_scene")
	queue_free()
	
func add_log_scene() -> void:
	var log_instance = log_scene.instantiate() as Node2D
	var texture_size = texture.get_size()
	var sprite_size = texture_size * global_scale
	log_instance.global_position = global_position + Vector2(0, sprite_size.y / 4)
	get_parent().add_child(log_instance)
