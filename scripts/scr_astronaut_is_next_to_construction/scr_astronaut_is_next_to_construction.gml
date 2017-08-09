/// @param astronaut
/// @param construction
var arg_astronaut = argument0;
var arg_construction = argument1;

var left = ds_map_find_value(arg_construction, construction_bb_left);
var right = ds_map_find_value(arg_construction, construction_bb_right);
var top = ds_map_find_value(arg_construction, construction_bb_top);
var bottom = ds_map_find_value(arg_construction, construction_bb_bottom);

var next_x = arg_astronaut.x;
var next_y = arg_astronaut.y;

if(next_y < bottom && next_y > top)
{
	next_x = arg_astronaut.x + 32;
	if(next_x > left && next_x < right)
	{
		return true;
	}
	next_x = arg_astronaut.x - 32;
	if(next_x > left && next_x < right)
	{
		return true;
	}		
}

next_x = arg_astronaut.x;
if(next_x > left && next_x < right)
{
	next_y = arg_astronaut.y + 32;
	if(next_y < bottom && next_y > top)
	{
		return true;
	}
	next_y = arg_astronaut.y - 32;
	if(next_y < bottom && next_y > top)
	{
		return true;
	}		
}

return false;