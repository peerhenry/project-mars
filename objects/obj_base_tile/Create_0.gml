scr_trace("basetile create event");

event_inherited();
wall_adjacency = 0;

// carrier of all grids
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_oxygen, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_hydrogen, macro_grid_role_carrier, 0);

scr_set_basetile_lights(id);

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.inside);

if(owner == macro_enemy) image_blend = make_color_rgb(255,235,205);