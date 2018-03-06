event_inherited();
name = "recharge station";
draw_cables = true;
has_power = false;
image_speed = 0;
image_index = 0;
depth = -occ_j;
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, 1);