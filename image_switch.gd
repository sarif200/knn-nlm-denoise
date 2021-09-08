extends OptionButton

onready var image_frame = get_node("../picture")
onready var file_selection = get_node("FileDialog")


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("item_selected",self,"change_image")




func change_image(id):
	var image = Image.new()
	if id == 0:
		image.load("res://images/self_made_cornel_box_noise.png")
	elif id == 1:
		image.load("res://images/Screenshot_2021-05-06 imageDenoising - imageDenoising pdf.png")
	elif id == 2:
		file_selection.popup()
		yield(file_selection,"file_selected")
		image.load(file_selection.get_current_path())
		print(file_selection.get_current_path())
	
	var texture = ImageTexture.new()
	texture.create_from_image(image,0)
	image_frame.set_texture(texture)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



