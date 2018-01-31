scr_trace("pump create event");
//show_debug_message("pump create event");

event_inherited();

// occupy map grid & nav grid
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

// For obj_grid_selector
grid_type_to_select = macro_grid_water;

// set grid props; for obj_grid_component
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, global.pump_energy_consumption);
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_source, global.pump_water_production);
if(!global.init_stage)
{
	scr_connect_to_cables(id);
	scr_connect_to_pipes(id);
}

// connect to drill
scr_drill_pump_connection(id);

// if(global.auto_complete) event_user(macro_event_finalize); // obsolete?