extends CharacterBody2D

@export var enemy_stats: stats
@onready var movement_component: movementComponent = %movementComponent
@onready var health_component: healthComponent = %healthComponent
@onready var hurt_box: hurtBox = $hurtBox

var player

func _ready() -> void:
	health_component.give_health(enemy_stats)

func _physics_process(_delta: float) -> void:
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]
		
	movement_component.direction = (player.global_position - global_position).normalized()
	movement_component.give_movement(enemy_stats)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		on_attack_initiated()
	
	die()

func on_attack_initiated():
	hurt_box.hurt_check(enemy_stats)

func die():
	if enemy_stats.health == 0:
		queue_free()
