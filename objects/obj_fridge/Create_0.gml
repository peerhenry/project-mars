event_inherited();
name = "refrigerator";
image_speed = 0;
depth = -occ_j;
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

// Fridge consumes energy
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, 1);

// Create inventory
inv_w = 4;
inv_h = 6;
inventory = ds_grid_create(inv_w, inv_h);