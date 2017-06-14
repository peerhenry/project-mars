var arg_instance = argument0;

var should_update_adjacent_cables = false;

with(arg_instance)
{
	switch(object_index)
	{
		case obj_pipe:
			depth -= 1; // pipes should appear on top of cables
			break;
		case obj_drill:
		case obj_pump:
		case obj_sensor:
		case obj_wall:
		case obj_battery:
			should_update_adjacent_cables = true;
		default:
			break;
	}
	
	if(should_update_adjacent_cables)
	{
		var east_cable = instance_position(x+32, y, obj_cable);
		var north_cable = instance_position(x, y-32, obj_cable);
		var west_cable = instance_position(x-32, y, obj_cable);
		var south_cable = instance_position(x, y+32, obj_cable);
		if(east_cable > 0)
		{
			east_cable.adjacency_number += west_number;
			scr_set_cable_image(east_cable);
		}
		if(north_cable > 0)
		{
			north_cable.adjacency_number += south_number;
			scr_set_cable_image(north_cable);
		}
		if(west_cable > 0)
		{
			west_cable.adjacency_number += east_number;
			scr_set_cable_image(west_cable);
		}
		if(south_cable > 0)
		{
			south_cable.adjacency_number += north_number;
			scr_set_cable_image(south_cable);
		}
	}//*/
}