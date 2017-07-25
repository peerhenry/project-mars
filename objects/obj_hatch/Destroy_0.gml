/// @description Remove hatch from room

// show_debug_message("hatch base_room: " + string(base_room)); // DEBUG
// show_debug_message("base_room is an obj_room: " + string((base_room.object_index == obj_room))); // DEBUG
event_inherited();

with(base_room)
{
	// show_debug_message("removing hatch from room..."); // DEBUG
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

// DEBUG
var free = scr_navgrid_cell_is_free(occ_i, occ_j);
show_debug_message("i,j : " + string(occ_i) + ", " + string(occ_j));
show_debug_message("at the end of hatch destruction, cell is free: " + string(free));