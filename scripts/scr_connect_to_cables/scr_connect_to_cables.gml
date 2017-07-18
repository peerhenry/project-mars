/// @param instance
var arg_instance = argument0;

var adjacents = scr_get_adjacent_instances(arg_instance, obj_cable); // ENWS

for(var n = 0; n < 4; n++)
{
	var next_cable = adjacents[n];
	if(next_cable != noone)
	{
		next_cable.adjacency_number += power(2, (n+2)%4);
		scr_set_cable_image(next_cable);
	}
}