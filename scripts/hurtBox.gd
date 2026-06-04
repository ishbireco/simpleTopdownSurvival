class_name hurtBox
extends Area2D

@export var hurt_area: Area2D
@export var attack_component: attackComponent
var player: CharacterBody2D

func hurt_check(stats):
	var players = get_tree().get_nodes_in_group("player")
	player = players[0]

	if hurt_area.overlaps_body(player):
		attack_component.attack(stats)
