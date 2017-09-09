scr_trace("pump create event");
//show_debug_message("pump create event");

event_inherited();

// occupy map grid & nav grid
mp_grid_add_cell( scr_get_nav_grid(), occ_i, occ_j );
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

// For obj_grid_selector
grid_type_to_select = macro_grid_water;

// set grid props; for obj_grid_component
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, global.pump_energy_consumption);
scr_connect_to_cables(id);
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_source, global.pump_water_production);

// connect to pipes
var adjacent_pipes = scr_get_adjacent_instances(id, obj_pipe);
for(var n = 0; n < 4; n++) // ENWS
{
	var next_adjacent = adjacent_pipes[n];
	if(next_adjacent != noone)
	{
		if(next_adjacent.object_index == obj_pipe)
		{
			next_adjacent.adjacency_number += power(2, (n+2)%4);
			scr_set_pipe_image(next_adjacent);
		}
	}
}

// connect to drill
scr_drill_pump_connection(id);

if(global.auto_complete) event_user(macro_event_finalize);