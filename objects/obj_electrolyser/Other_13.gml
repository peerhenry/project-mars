/// @description Init
event_inherited();

name = "electrolyser";
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, 1);
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_consumer, 1);
scr_set_new_grid_props(id, macro_grid_oxygen, macro_grid_role_source, 1);
scr_set_new_grid_props(id, macro_grid_hydrogen, macro_grid_role_source, 1);

image_speed = 0;
depth = -occ_j;

is_active = false;