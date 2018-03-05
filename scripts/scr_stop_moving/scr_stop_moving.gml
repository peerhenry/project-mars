/// @arg entity
var arg_entity = argument0;
with(arg_entity)
{
	if(path_exists(path))
	{
		path_position = 1;
		path_delete(path);
		path = noone;
		path_end();
	}
	image_speed = 0;
	image_index = 0;
	x = scr_gi_to_rc(occ_i);
	y = scr_gi_to_rc(occ_j);
}