/// @param astronaut
/// @param construction
/// @param side
var arg_astronaut = argument0;
var arg_construction = argument1;
var arg_side = argument2;

var next_x = 0;
var next_y = 0;

var bottom = arg_construction[? construction_bb_bottom];
var top = arg_construction[? construction_bb_top];
var right = arg_construction[? construction_bb_right];
var left = arg_construction[? construction_bb_left];
var count = 0;

switch(arg_side)
{
	case macro_east_number:
	case macro_west_number:
		count = round((bottom-top)/32);
		break;
	case macro_north_number:
	case macro_south_number:
		count = round((right-left)/32);
		break;
}

for(var n = 0; n < count; n++)
{
	switch(arg_side)
	{
		case macro_east_number:
			next_x = right + 16;
			next_y = top + 16 + 32*n;
			break;
		case macro_north_number:
			next_x = left + 16 + 32*n;
			next_y = top - 16;
			break;
		case macro_west_number:
			next_x = left - 16;
			next_y = top + 16 + 32*n;
			break;
		case macro_south_number:
			next_x = left + 16 + 32*n;
			next_y = bottom + 16;
			break;
	}
	if(scr_navigation_is_possible(arg_astronaut, next_x, next_y)) return [next_x, next_y];	
}

return noone;