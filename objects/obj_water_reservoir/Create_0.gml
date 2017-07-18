event_inherited();
scr_navgrid_occupy(occ_i, occ_j);
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_storage, 1000);

water_rectangle_left = x-13;
water_rectangle_right = x+12;
water_rectangle_top = y-13;
water_rectangle_bottom = y+12;
scr_water_reservoir_set_image(id);

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);