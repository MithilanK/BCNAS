extends Particles2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (NodePath) var TargetNodepath = null
var node = null
# Called when the node enters the scene tree for the first time.
func _ready():
	node = get_node(TargetNodepath) 

func _process(delta):
 
	self.position = node.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
