class_name movementComponent
extends Node

var direction: Vector2
@export var mover: CharacterBody2D

func give_movement(stats):
	mover.velocity = direction * stats.speed
	mover.move_and_slide()
