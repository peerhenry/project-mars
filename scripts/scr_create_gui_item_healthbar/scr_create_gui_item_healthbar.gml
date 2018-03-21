/// @arg left
/// @arg top
/// @arg width
/// @arg height
/// @arg unit
/// @arg prop
var arg_left = argument0;
var arg_top = argument1;
var arg_width = argument2;
var arg_height = argument3;
var arg_unit = argument4;
var arg_prop = argument5;

var item = instance_create_layer(0,0,0,dto_gui_item);
with(item)
{
	unit = arg_unit;
	left = arg_left;
	top = arg_top;
	width = arg_width;
	height = arg_height;
	right = left + width;
	bottom = top + height;
	bar_left = left;
	bar_top = top;
	bar_right = right;
	bar_bottom = bottom;
	bar_prop = arg_prop;
	// todo: set step behavior
	switch(arg_prop)
	{
		case unit_prop.food:
			// bar_color = 
			break;
	}
}
return item;