var arg_instance = argument0;

with(arg_instance)
{
	switch(object_index)
	{
		case obj_drill:
			// connect to grid
			var resource = scr_map_buffer_get_resource(occ_i, occ_j);
			is_mining = (resource == resource.metal);
			if(is_mining) image_speed = 1;
			break;
	}
}