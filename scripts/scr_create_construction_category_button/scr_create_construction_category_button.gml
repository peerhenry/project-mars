/// @arg gui_container
/// @arg x
/// @arg y
/// @arg sprite
/// @arg category
/// @arg tooltip
var arg_container = argument0;
var arg_left = argument1;
var arg_top = argument2;
var arg_category = argument3;
var arg_sprite = argument4;
var arg_tooltip = argument5;
var b1 = scr_create_gui_item_sprite(arg_container, arg_left, arg_top, arg_sprite);
with(b1)
{
	sprite_x += 16;
	sprite_y += 16;
	should_draw_panel = true;
	tooltip_title = arg_tooltip;
	category = arg_category;
	width = 32;
	height = 32;
	bottom = top + height;
	right = left + width;
}