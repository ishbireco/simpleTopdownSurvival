class_name hurtBox
extends Area2D

@export var hurt_area: Area2D
@export var attack_component: attackComponent
var grouper: CharacterBody2D
@export var group: String

func hurt_check(stats):
	var groupers = get_tree().get_nodes_in_group(group)
	if groupers.size() > 0:
		grouper = groupers[0]
	else:
		return

	if hurt_area.overlaps_body(grouper):
		attack_component.attack(stats)
