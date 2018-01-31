event_inherited();
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

// Set grid type to select for obj_grid_selector
grid_type_to_select = macro_grid_electric;

scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_source, global.solar_panel_energy_production);

if(!global.init_stage) scr_connect_to_cables(id);