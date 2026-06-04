extends CharacterBody2D

@onready var input_compnent: inputCompnent = $inputCompnent
@onready var movement_component: movementComponent = $movementComponent
@onready var health_component: healthComponent = $healthComponent
@onready var attack_component: attackComponent 
@onready var hurt_box: hurtBox = $hurtBox
@export var player_stats: stats

func _ready() -> void:
	health_component.give_health(player_stats)
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.one_shot = false   
	add_child(timer)
	timer.start()
	timer.timeout.connect(_on_timer_timeout)

#called every frame
func _process(_delta):
	movement_component.mover = input_compnent.mover
	movement_component.direction = input_compnent.direction
	input_compnent.get_input(player_stats)
	movement_component.give_movement(player_stats)

func _on_timer_timeout():
	hurt_box.hurt_check(player_stats)

	