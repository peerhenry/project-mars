/// @param astronaut
/// @param construction
var arg_astronaut = argument0;
var arg_construction = argument1;

var bottom = arg_construction[? construction_bb_bottom];
var top = arg_construction[? construction_bb_top];
var right = arg_construction[? construction_bb_right];
var left = arg_construction[? construction_bb_left];
var constr_center_x = (left + right)/2;
var constr_center_y = (top + bottom) /2;

var dx = arg_astronaut.x - constr_center_x;
var dy = arg_astronaut.y - constr_center_y;

var next_x = 0;
var next_y = 0;

var side_order = [macro_south_number, macro_west_number, macro_east_number, macro_north_number];

if(dy > dx)
{
	if(dy > -dx)
	{
		// south is closest
		if(dx < 0)
		{
			// west is second closest: DEFAULT
		}
		else
		{
			// east is second closest
			side_order[1] = macro_east_number;
			side_order[2] = macro_west_number;
		}
	}
	else
	{
		// west is closest
		if(dy > 0)
		{
			// south is second closest
			side_order = [macro_west_number, macro_south_number, macro_north_number, macro_east_number];
		}
		else
		{
			// north is second closest
			side_order = [macro_west_number, macro_north_number, macro_south_number, macro_east_number];
		}
	}
}
else
{
	if(dy > -dx)
	{
		// east is closest
		if(dy > 0)
		{
			// south is second closest
			side_order = [macro_east_number,macro_south_number,macro_north_number,macro_west_number];
		}
		else
		{
			// north is second closest
			side_order = [macro_east_number,macro_north_number,macro_south_number,macro_west_number];
		}
	}
	else
	{
		// north is closest
		if(dx > 0)
		{
			// east is second closest
			side_order = [macro_north_number,macro_east_number,macro_west_number,macro_south_number];
		}
		else
		{
			// west is second closest
			side_order = [macro_north_number,macro_west_number,macro_east_number,macro_south_number];
		}
	}
}

var result = noone;
var n = 0;
while(result == noone && n<4)
{
	result = scr_find_spot_along_side(arg_astronaut, arg_construction, side_order[n]);
	n++;
}

return result;