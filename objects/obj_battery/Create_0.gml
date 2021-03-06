event_inherited();
name = "battery";
// Occupy navgrid & execute map buffer action
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

// Set grid type to select for obj_grid_selector
grid_type_to_select = macro_grid_electric;

// Set electric grid for obj_grid_component
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_storage, 1000);

depth = -occ_j;