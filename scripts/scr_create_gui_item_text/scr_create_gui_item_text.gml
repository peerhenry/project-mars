/// @arg x
/// @arg y
/// @arg font
/// @arg text
var arg_left = argument0;
var arg_top = argument1;
var arg_font = argument2;
var arg_text = argument3;

var item = instance_create_layer(0,0,0,dto_gui_item);
with(item)
{
	class = gui_item_class.label;
	font = arg_font;
	text = arg_text;
	text_x = arg_x;
	text_y = arg_y;
	text_color = c_white;
	draw_set_font(font);
	var sw = string_width(text);
	var sh = string_height(text);
	left = text_x;
	top = text_y;
	width = sw;
	height = sh;
	right = left + width;
	bottom = top + height;
}
return item;