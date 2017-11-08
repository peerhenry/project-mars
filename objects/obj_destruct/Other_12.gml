/// @description Finalize construction
var base_component = instance_position(x, y, obj_base_component);
scr_navgrid_clear_cell( occ_i, occ_j );
if(base_component != noone)
{
	with(base_component)
	{
		instance_destroy();
		if(object_index == obj_hatch && !under_construction)
		{
			// replace hatch with wall
			var get_layer_for = script_container_resolve(script_container, "get_layer_for");
			var lid = script_execute(get_layer_for, obj_wall);
			var new_wall = instance_create_layer(x, y, lid, obj_wall);
			with(new_wall)
			{
				event_user(macro_event_finalize);
			}
		}
	}
}
else
{
	// try to remove foundation
	// var base_foundation = instance_position(x, y, obj_base_foundation);
}
instance_destroy();