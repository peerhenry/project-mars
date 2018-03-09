/// @arg unit
/// @arg x
/// @arg y
/// @arg width
/// @arg height
var arg_unit = argument0;
var arg_x = argument1;
var arg_y = argument2;
var arg_width = argument3;
var arg_height = argument4;

var dto = instance_create_depth(0,0,0,dto_details_panel_component);

with(dto)
{
	unit = arg_unit;
	class = details_panel_component_class.avatar;
	left = arg_x;
	top = arg_y;
	right = arg_x + arg_width;
	bottom = arg_y + arg_height;
	width = arg_width;
	height = arg_height;
	rectangle_color_top = c_dkgray;
	rectangle_color_top = c_dkgray;
	rectangle_color_bottom = c_black;
	rectangle_color_bottom = c_black;
}

return dto;