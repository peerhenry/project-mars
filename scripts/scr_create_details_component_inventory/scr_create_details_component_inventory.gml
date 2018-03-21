/// @arg unit
/// @arg x
/// @arg y
var arg_unit = argument0;
var arg_x = argument1;
var arg_y = argument2;

var dto = instance_create_depth(0,0,0,dto_gui_panel_item);

with(dto)
{
	unit = arg_unit;
	class = details_panel_component_class.inventory;
	left = arg_x;
	top = arg_y;
	sprite = spr_inventory_grid;
	if(arg_unit.object_index == obj_fridge) sprite = spr_fridge_inventory_grid;
	
	width = sprite_get_width(sprite);
	height = sprite_get_height(sprite);
	right = left + width;
	bottom = top + height;
}

return dto;