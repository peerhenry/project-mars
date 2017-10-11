/// @description Remove hatch from room

event_inherited();

with(base_room)
{
	var ind = ds_list_find_index(hatches, other.id);
	ds_list_delete(hatches, ind);
}

if(!under_construction)
{
	// replace hatch with wall
	var lid = layer_get_id("base_tall");
	var new_wall = instance_create_layer(x, y, lid, obj_wall);
	with(new_wall)
	{
		event_user(macro_event_finalize);
	}
}

if(connects_horizontally)
{
	scr_execute_map_buffer_action(occ_i + 1, occ_j, map_buffer_action.clear);
	scr_execute_map_buffer_action(occ_i - 1, occ_j, map_buffer_action.clear);
}
else
{
	scr_execute_map_buffer_action(occ_i, occ_j + 1, map_buffer_action.clear);
	scr_execute_map_buffer_action(occ_i, occ_j - 1, map_buffer_action.clear);
}