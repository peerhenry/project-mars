/// @arg container
/// @arg left
/// @arg top
/// @arg width
/// @arg height
/// @arg unit
/// @arg prop
var arg_container = argument0;
var arg_left = argument1;
var arg_top = argument2;
var arg_width = argument3;
var arg_height = argument4;
var arg_unit = argument5;
var arg_prop = argument6;

var item = instance_create_depth(arg_container, 0, 0, dto_gui_item);
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
	step_script = scr_gui_item_step_healthbar;
	should_draw_healthbar = true;
	switch(arg_prop)
	{
		case unit_prop.health_integrity:
		case unit_prop.integrity:
		case unit_prop.entity_health:
			bar_color = c_lime;
			break;
		case unit_prop.food:
			bar_color = global.food_bar_color;
			break;
		case unit_prop.sleep:
			bar_color = global.sleep_bar_color;
			break;
		case unit_prop.battery_charge:
			bar_color = c_aqua; // todo: move to settings
			break;
		case unit_prop.suit_oxygen:
			bar_color = global.oxygen_bar_color;
			break;
	}
}
return item;