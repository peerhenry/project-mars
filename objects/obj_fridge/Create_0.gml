event_inherited();
image_speed = 0;
depth = -occ_j;
scr_navgrid_occupy(occ_i, occ_j);
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

// Fridge consumes energy
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, 1);

// Create inventory
inventory = ds_grid_create(4, 6);

// selectable
is_selected = false;