extends CharacterBody2D

@export var enemy_stats: stats
@onready var movement_component: movementComponent = $movementComponent
var player

func _physics_process(_delta: float) -> void:
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]
		
	movement_component.direction = (player.global_position - global_position).normalized()
	movement_component.give_movement(enemy_stats)
