/// @arg container
/// @arg left
/// @arg top
/// @arg width
/// @arg height
function scr_create_gui_item(argument0, argument1, argument2, argument3, argument4) {
	var arg_container = argument0;
	var arg_left = argument1;
	var arg_top = argument2;
	var arg_width = argument3;
	var arg_height = argument4;
	var right = arg_left + arg_width;
	var bottom = arg_top + arg_height;

	var item = instance_create_depth(arg_container, 0, 0, obj_gui_item);
	item.left = arg_left;
	item.top = arg_top;
	item.width = arg_width;
	item.height = arg_height;
	item.bottom = bottom;
	item.right = right;
	return item;


}
