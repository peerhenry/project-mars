/// @param instance
var arg_instance = argument0;
var adjacents = scr_get_adjacent_grid_components(arg_instance, macro_grid_electric);

for(var n = 0; n < 4; n++)
{
	var next = adjacents[n];
	if(next != noone && next.owner == arg_instance.owner)
	{
		var bit = power(2, (n+2)%4);
		if(next.cable_adjacency & bit != 0)
		{
			next.cable_adjacency -= bit;
			if(next.object_index == obj_cable) scr_set_cable_image(next);
		}
	}
}