/// @arg instance
/// @arg owner
var arg_instance = argument0;
var arg_owner = argument1;

var ds_min = 9999999999;
var astro = noone;

with(obj_astronaut)
{
	if(owner == arg_owner)
	{
		var dx = x - arg_instance.x;
		var dy = y - arg_instance.y;
		var ds = dx*dx + dy*dy;
		if(ds < ds_min)
		{
			ds_min = ds;
			astro = id;
		}
	}
}

return astro;