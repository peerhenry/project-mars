/// @arg unit
/// @arg left
/// @arg top
/// @arg width
/// @arg height
/// @arg sprite
/// @arg action
var arg_unit = argument0;
var arg_left = argument1;
var arg_top = argument2;
var arg_width = argument3;
var arg_height = argument4;
var arg_sprite = argument5;
var arg_action = argument6;

var dto = instance_create_depth(0, 0, 0, dto_gui_panel_item);

with(dto)
{
	unit = arg_unit;
	class = details_panel_component_class.sprite_button;
	draw_as_panel = true;
	left = arg_left;
	width = arg_width;
	right = left + width - 1;
	top = arg_top;
	height = arg_height;
	bottom = top + height - 1;
	sprite = arg_sprite;
	sprite_x = left + (width - sprite_get_width(arg_sprite))/2;
	sprite_y = top + (height - sprite_get_height(arg_sprite))/2;
	action = arg_action;
}

return dto;