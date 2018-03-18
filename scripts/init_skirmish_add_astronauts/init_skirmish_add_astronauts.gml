/// @arg or_i
/// @arg or_j
/// @arg count
/// @arg owner
var arg_or_i = argument0;
var arg_or_j = argument1;
var arg_count = argument2;
var arg_owner = argument3;

var next_i = arg_or_i - 1;
for(var n = 0; n < arg_count; n++)
{
	next_i++;
	var target_x = scr_gi_to_rc(next_i);
	var target_y = scr_gi_to_rc(arg_or_j);
	var free = scr_navgrid_cell_is_free(next_i, arg_or_j) && !position_meeting(target_x, target_y, obj_door);
	if(!free)
	{
		var count = 0;
		while(!free && count < 10)
		{
			arg_or_j++;
			next_i = arg_or_i;
			free = scr_navgrid_cell_is_free(next_i, arg_or_j);
			count++;
		}
		target_x = scr_gi_to_rc(next_i);
		target_y = scr_gi_to_rc(arg_or_j);
	}
	global.default_owner = arg_owner;
	var astro = instance_create_layer(target_x, target_y, macro_astronaut_layer, obj_astronaut);
	{
		astro.owner = arg_owner;
	}
	var outside = !position_meeting(target_x, target_y, obj_base_tile);
	scr_set_suit(astro, outside);
	astro.is_outside = outside;
}