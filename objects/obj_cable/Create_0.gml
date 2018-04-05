event_inherited();
name = "cable";
do_destroy_logic = true; // flag is set to false if being built on top of cable
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.cable);
// electric grid
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_carrier, 0);
scr_set_cable_image(id);

show_debug_message("image index has been set: " + string(image_index)); // DEBUG
show_debug_message("cable adjacency: " + string(cable_adjacency));