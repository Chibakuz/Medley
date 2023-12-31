extends Control

@export var health_change_label : PackedScene
@export var damage_color : Color = Color.DARK_RED
@export var heal_color : Color = Color.DARK_GREEN


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("on_healt_change", on_signal_health_change)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func on_signal_health_change(node : Node, amount_change : int):
	var label_instance : Label = health_change_label.instantiate()
	node.add_child(label_instance)
	label_instance.text = str(amount_change)
	
	if(amount_change >= 0):
		label_instance.modulate = heal_color
	else:
		label_instance.modulate = damage_color
