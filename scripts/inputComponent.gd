class_name inputCompnent
extends Node

@export var mover: CharacterBody2D
@onready var attack_component: attackComponent = $'../attackComponent'
var direction: Vector2

func get_input(stats):
	direction = Input.get_vector("left","right","up","down")
	if Input.is_action_just_pressed("attack"):
		attack_component.attack(stats)
		