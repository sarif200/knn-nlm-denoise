extends TextureRect





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_size_box_value_changed(value):
	self.material.set_shader_param("size",value)


func _on_H_box_value_changed(value):
	self.material.set_shader_param("h",value)


func _on_R_box_value_changed(value):
	self.material.set_shader_param("r",value)


func _on_LERP_VALUE_box_value_changed(value):
	self.material.set_shader_param("lerpvalue",value)


func _on_WEIGHT_TRESHOLD_box_value_changed(value):
	self.material.set_shader_param("weight_treshold",value)
	

func _on_LERP_TRESHOLD_box_value_changed(value):
	self.material.set_shader_param("lerp_treshold",value)
