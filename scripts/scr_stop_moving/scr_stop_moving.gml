/// @arg entity
var arg_entity = argument0;
with(arg_entity)
{
	if(path_exists(path))
	{
		path_end();
		path_position = 1;
		path_delete(path);
		path = noone;
	}
	image_speed = 0;
	image_index = 0;
}