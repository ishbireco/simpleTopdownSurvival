class_name attackComponent
extends Node

func attack(stats):
	stats.health -= stats.damage
	stats.health = clampf(stats.health, stats.min_health, stats.max_health)
