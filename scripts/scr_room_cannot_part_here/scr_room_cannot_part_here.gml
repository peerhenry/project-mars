/// @arg room
/// @arg i
/// @arg j
var arg_room = argument0;
var arg_i = argument1;
var arg_j = argument2;

var flip_count = 0;
var in_gap = false;
var dis = [-1,0,1,1,1,0,-1,-1];
var djs = [-1,-1,-1,0,1,1,1,0];
for(var n = 0; n<8; n++)
{
	var next_i = arg_i + dis[n];
	var next_j = arg_j + djs[n];
	var contains_tile = scr_check_tile_in_room(arg_room, next_i, next_j);
	if(contains_tile)
	{
		if(in_gap)
		{
			flip_count++; 
			in_gap = false;
		}
	}
	else
	{
		in_gap = true;
	}
}

return flip_count<2;