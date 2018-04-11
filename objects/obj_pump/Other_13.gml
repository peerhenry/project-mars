/// @description Init
event_inherited();
name = "pump";
draw_cables = true;

// occupy map grid & nav grid
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

// For obj_grid_selector
grid_type_to_select = macro_grid_water;

// set grid props; for obj_grid_component
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, global.pump_energy_consumption);
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_source, global.pump_water_production);