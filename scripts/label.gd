extends Label

@export var stats: stats

func _process(_delta: float) -> void:
	text = str(stats.health)