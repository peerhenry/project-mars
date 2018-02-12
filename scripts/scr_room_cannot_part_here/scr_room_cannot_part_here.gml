/// @arg room
/// @arg i
/// @arg j
var arg_room = argument0;
var arg_i = argument1;
var arg_j = argument2;

// a flip is a transition from a room tile to a non-room tile in the surrounding 8 tiles.
var flip_count = 0;
var dis = [-1,0,1,1,1,0,-1,-1];
var djs = [-1,-1,-1,0,1,1,1,0];
var next_i = arg_i + dis[0];
var next_j = arg_j + djs[0];
var in_gap = !scr_check_tile_in_room(arg_room, next_i, next_j);;
for(var n = 1; n<8; n++)
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
		if(!in_gap)
		{
			flip_count++;
			in_gap = true;
		}
	}
}

return flip_count<3;