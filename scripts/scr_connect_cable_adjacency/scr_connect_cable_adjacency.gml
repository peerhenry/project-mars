/// @param instance
var arg_instance = argument0;
var adjacents = scr_get_adjacent_grid_components(arg_instance, macro_grid_electric);

show_debug_message("connect to adjacent components...");

with(arg_instance)
{
	for(var n = 0; n < 4; n++)
	{
		var next_comp = adjacents[n];
		if(next_comp != noone)
		{
			show_debug_message("next_comp != noone");
			
			var bit = power(2, n);
			if(cable_adjacency & bit == 0)
			{
				cable_adjacency += bit;
			}
		
			var cable_bit = power(2, (n+2)%4);
			if(next_comp.cable_adjacency & cable_bit == 0)
			{
				with(next_comp)
				{
					cable_adjacency += cable_bit;
					if(object_index == obj_cable) scr_set_cable_image(next_comp);
				}
			}
		}
	}
}