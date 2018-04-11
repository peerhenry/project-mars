/// @description Init
event_inherited();

name = "pipe";
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_oxygen, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_hydrogen, macro_grid_role_carrier, 0);

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.pipe);