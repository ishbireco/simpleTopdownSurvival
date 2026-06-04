extends Label

@export var enemy_stats: stats

func _process(delta: float) -> void:
	text = str(enemy_stats.health)
