///@param instance
// wall logic only sets correct sprites and angles for walls.
var arg_instance = argument0;

with(arg_instance)
{
	if(object_index == obj_wall)
	{
		scr_update_wall_and_adjacents(arg_instance);
	}
	else if(object_index == obj_door)
	{
		scr_update_adjacent_walls(x, y);
	}
}