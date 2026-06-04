extends CharacterBody2D

@export var enemy_stats: stats
@onready var movement_component: movementComponent = $movementComponent
@onready var health_component: healthComponent = $healthComponent
@onready var hurt_box: hurtBox = $hurtBox

var player

func _ready() -> void:
	health_component.give_health(enemy_stats)
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.one_shot = false   
	add_child(timer)
	timer.start()
	timer.timeout.connect(_on_timer_timeout)

func _physics_process(_delta: float) -> void:
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]
		
	movement_component.direction = (player.global_position - global_position).normalized()
	movement_component.give_movement(enemy_stats)

func _process(delta: float) -> void:
	die()

func _on_timer_timeout():
	hurt_box.hurt_check(enemy_stats)

func die():
	if enemy_stats.health == 0:
		queue_free()
