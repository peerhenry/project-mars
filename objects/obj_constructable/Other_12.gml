/// @description Finalize construction
scr_trace("constructable finalize event");
if(under_construction)
{
	construction_instance = noone;
	under_construction = false;
	scr_grid_logic(id);
	
	if(object_index != obj_cable && object_index != obj_pipe)
	{
		var cable = instance_position(x, y, obj_cable);
		if(cable != noone)
		{
			cable.do_destroy_logic = false;
			instance_destroy(cable);
		}
		var pipe = instance_position(x, y, obj_pipe);
		if(pipe != noone)
		{
			pipe.do_destroy_logic = false;
			instance_destroy(pipe);
		}
	}
}