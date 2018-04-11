/// @description Init
event_inherited();

name = "3D printer";
mp_grid_add_cell( scr_get_nav_grid(), occ_i, occ_j );
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, 1);

image_speed = 0;
depth = -occ_j;

is_active = false;
is_printing = false;
has_mdu = false;