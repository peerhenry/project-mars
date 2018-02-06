// includes navigation
/// @param assignable
/// @param astronaut
var arg_assignable = argument0;
var arg_astronaut = argument1;

var can_assign = false;
var already_adjacent = false;
if(!arg_assignable.is_assigned)
{
	// Return false if the assignment cannot be done
	// if(!scr_can_assign(arg_assignable, arg_astronaut)) return false; // moved to scr_command_assign
	
	// Check if astronaut can navigate to assignable.
	var ass_i = arg_assignable.occ_i;
	var ass_j = arg_assignable.occ_j;
	var astro_i = arg_astronaut.occ_i;
	var astro_j = arg_astronaut.occ_j;
		
	already_adjacent = (astro_i == ass_i && abs(astro_j - ass_j) == 1)
		|| (astro_j == ass_j && abs(astro_i - ass_i) == 1);
		
	if(already_adjacent)
	{
		can_assign = true; // no need to navigate
	}
	else // Try to navigate to any cell adjacent to the assignable
	{
		// Get all adjacent cells (warning: incomplete for constructions with multiple cells)
		with(arg_astronaut)
		{
			scr_navgrid_clear_cell(occ_i, occ_j);
			scr_navgrid_clear_cell(dest_i, dest_j);
		}
		
		var free_spots = ds_list_create();
		var spots = scr_get_assignable_spots(arg_assignable, arg_astronaut);
		for(var n = 0; n < array_length_1d(spots); n++)
		{
			var next_spot = spots[n];
			var spot_i = scr_decode_grid_coord_i(next_spot);
			var spot_j = scr_decode_grid_coord_j(next_spot);
			if( scr_navgrid_cell_is_free(spot_i, spot_j) )
			{
				ds_list_add(free_spots, next_spot);
			}
		}
		
		with(obj_astronaut)
		{
			scr_navgrid_clear_cell(occ_i, occ_j);
			scr_navgrid_clear_cell(dest_i, dest_j);
		}
		
		var n = 0;
		while(!can_assign && n < ds_list_size(free_spots))
		{
			var next_spot = free_spots[|n];
			var spot_i = scr_decode_grid_coord_i(next_spot);
			var spot_j = scr_decode_grid_coord_j(next_spot);
			var s_x = scr_gi_to_rc(spot_i);
			var s_y = scr_gi_to_rc(spot_j);
			can_assign = scr_navigate_once(arg_astronaut, s_x, s_y);
			n++;
		}
		
		with(obj_astronaut)
		{
			scr_navgrid_occupy(occ_i, occ_j);
			scr_navgrid_occupy(dest_i, dest_j);
		}
		
		ds_list_destroy(free_spots);
	}
}

if(can_assign)
{
	var get_layer_for = script_container_resolve(arg_astronaut.script_container, "get_layer_for");
	var logic_layer = script_execute(get_layer_for, obj_assign_icon);
	var icon = instance_create_layer(arg_assignable.x, arg_assignable.y-16, logic_layer, obj_assign_icon);
	arg_assignable.is_assigned = true;
	arg_assignable.icon = icon;
	arg_assignable.assigned_astronaut = arg_astronaut;
	arg_astronaut.assigned_object = arg_assignable;
	if(already_adjacent)
	{
		// navigate to center of tile
		scr_end_path_action(arg_astronaut);
		scr_cancel_walking(arg_astronaut);
	}
}

return can_assign;