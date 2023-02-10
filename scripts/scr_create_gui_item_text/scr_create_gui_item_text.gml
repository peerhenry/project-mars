/// @arg container
/// @arg x
/// @arg y
/// @arg font
/// @arg text
function scr_create_gui_item_text(argument0, argument1, argument2, argument3, argument4) {
	var arg_container = argument0;
	var arg_left = argument1;
	var arg_top = argument2;
	var arg_font = argument3;
	var arg_text = argument4;

	var item = instance_create_depth(arg_container, 0, 0, obj_gui_item);
	with(item)
	{
		class = gui_item_class.label;
		font = arg_font;
		text = arg_text;
		text_x = arg_left;
		text_y = arg_top;
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


}
