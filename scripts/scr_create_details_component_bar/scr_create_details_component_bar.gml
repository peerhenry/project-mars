/// @arg unit
/// @arg unit_prop
/// @arg left
/// @arg top
/// @arg width
/// @arg height
/// @arg color
var arg_unit = argument0;
var arg_prop = argument1;
var arg_left = argument2;
var arg_top = argument3;
var arg_width = argument4;
var arg_height = argument5;
var arg_color = argument6;

var dto = instance_create_depth(0, 0, 0, dto_details_panel_component);

with(dto)
{
	unit = arg_unit;
	class = details_panel_component_class.bar;
	unit_property = arg_prop;
	left = arg_left;
	width = arg_width;
	right = left + width;
	top = arg_top;
	height = arg_height;
	bottom = top + height;
	bar_color = arg_color;
}

return dto;