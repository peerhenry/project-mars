scr_trace("constructable destroy event");
scr_destroy_instance_grid_logic(id);
with(dto_hud_details_panel) if(unit == other.id) instance_destroy();

if(object_index != obj_cable && object_index != obj_pipe)
{
	var cable = instance_position(x, y, obj_cable);
	if(cable != noone)
	{
		cable.do_destroy_logic = true;
		instance_destroy(cable);
	}
	var pipe = instance_position(x, y, obj_pipe);
	if(pipe != noone)
	{
		pipe.do_destroy_logic = true;
		instance_destroy(pipe);
	}
}