event_inherited();
name = "cable";
do_destroy_logic = true; // flag is set to false if being built on top of cable
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.cable);
// electric grid
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_carrier, 0);
// begin === SET ADJACENCY NUMBER AND IMAGE INDEX ===
if(!global.init_stage) scr_connect_cable(id);