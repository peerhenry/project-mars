///@param instance
// wall logic sets correct sprites and angles for walls
// also solidifies walls and gates (so astronauts can't shoot through them)
var arg_instance = argument0;

exit; // REFACTOR: new wall images

with(arg_instance)
{
	switch(object_index)
	{
		case obj_wall:
			solid = true;
			scr_update_wall_and_adjacents(arg_instance);
			break;
		case obj_door:
			solid = true;
			scr_update_adjacent_walls(x, y);
			break;
		case obj_base_tile:
			scr_update_adjacent_walls(x, y);
			break;
		case obj_hatch:
			solid = true;
			break;
	}
}