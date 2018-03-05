/// @arg destruction
var arg_destruction = argument0;

var deletions = ds_list_create();
var construction_rechecks = ds_list_create();

var destruction_cells_list = ds_map_find_value(arg_destruction, construction_cells);
var count = ds_list_size(destruction_cells_list);
for(var n = 0; n < count; n++) // loop over cells
{
	// - get construction cell parameters
	var next_cell = destruction_cells_list[|n];
	var added_instance = next_cell[? c_cell_new_instance];
	var object_to_remove = next_cell[? c_cell_object_to_remove];
	var target_layer = next_cell[? c_cell_layer];
	var i = next_cell[? c_cell_i];
	var j = next_cell[? c_cell_j];
	var cell_x = scr_gi_to_rc(i);
	var cell_y = scr_gi_to_rc(j);
	
	// - remove any removals
	if(object_to_remove == noone)
	{
		show_error("object_to_remove was noone in scr_handle_new_destruction", true);
	}
	
	var removal = instance_position(cell_x, cell_y, object_to_remove);
	if(removal.under_construction)
	{
		// find the construction cell that removal belongs to...
		var constr = removal.construction_instance;
		if(!ds_exists(constr, ds_type_map))
		{
			show_error("No construction instance for: " + object_get_name(removal.object_index), true)
		}
		
		if(ds_list_find_index(construction_rechecks, constr) == -1) ds_list_add(construction_rechecks, constr);
		var construction_cells_list = constr[? construction_cells];
		var construction_cell_count = ds_list_size(construction_cells_list);
		var cell = noone;
		var cell_index = -1;
		for(var m = 0; m < construction_cell_count; m++) // loop over cells
		{
			var next_constr_cell = construction_cells_list[|m];
			if(next_constr_cell[? c_cell_new_instance] == removal)
			{
				ds_map_replace(next_constr_cell, c_cell_new_instance, noone);
				cell = next_constr_cell;
				cell_index = m;
				break;
			}
		}
		
		// if no replacement, destroy the cell and delete it from cell_list, otherwise modify the cell
		if(added_instance.object_index == obj_destruct_placemarker) // pure removal
		{
			ds_map_destroy(next_constr_cell);
			if(cell_index >= 0)
			{
				ds_list_delete(construction_cells_list, cell_index);
			}
			instance_destroy(removal);
			instance_destroy(added_instance);
		}
		else // replacement
		{
			// modify the cell
			ds_map_replace(cell, c_cell_new_instance, added_instance);
			ds_map_replace(cell, c_cell_layer, target_layer);
			ds_map_replace(cell, c_cell_object_to_remove, noone);
			added_instance.construction_instance = constr;
			instance_destroy(removal);
		}
		
		// remove cell from destruction
		ds_list_add(deletions, next_cell);
	}
	else
	{
		// something may need to happen to removal not under construction
		if(object_is_ancestor(removal.object_index, obj_gate))
		{
			// todo: Gates must not be allowed to be active while under deconstruction...
			with(removal)
			{
				if(is_open) scr_gate_toggle(removal);
				scr_navgrid_occupy(occ_i, occ_j);
				under_destruction = true; // boolean to prevent mouse control over gate
			}
		}
	}
}

for(var n = 0; n<ds_list_size(deletions); n++)
{
	var delete_cell = deletions[|n];
	var index = ds_list_find_index(destruction_cells_list, delete_cell);
	ds_list_delete(destruction_cells_list, index);
	ds_map_destroy(delete_cell);
}
ds_list_destroy(deletions);

for(var n = 0; n<ds_list_size(construction_rechecks); n++)
{
	var next_constr = construction_rechecks[|n];
	var cells = next_constr[?construction_cells];
	var current_mdu_req = next_constr[?construction_required_mdu_count];
	var req_mdu_count = scr_calculate_required_mdu_count(cells);
	if(req_mdu_count == 0)
	{
		scr_cancel_construction(global.script_container, constr);
	}
	else
	{
		if(current_mdu_req != req_mdu_count)
		{
			var diff = current_mdu_req - req_mdu_count;
			ds_map_replace(next_constr, construction_required_mdu_count, req_mdu_count);
			var rem = next_constr[?construction_required_mdu_remaining];
			ds_map_replace(next_constr, construction_required_mdu_remaining, rem - diff);
		}
		// update build state & build time
		var required_metal = next_constr[?construction_required_metal];
		var new_build_time = scr_calculate_build_time(req_mdu_count, required_metal);
		ds_map_replace(next_constr, construction_time, new_build_time);
	}
}

ds_list_destroy(construction_rechecks);

// if destruction has no more cells, destroy the destruction
var new_count = ds_list_size(destruction_cells_list);
if(count != new_count)
{
	if(new_count == 0)
	{
		scr_unregister_construction(arg_destruction);
		ds_map_destroy(arg_destruction);
	}
	else
	{
		// update destruction
		var new_mdu_count = scr_calculate_required_mdu_count(destruction_cells_list);
		ds_map_replace(arg_destruction, construction_required_mdu_count, new_mdu_count);
	}
}