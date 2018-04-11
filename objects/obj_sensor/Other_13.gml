/// @description Init
event_inherited();

name = "seismic sensor";
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);
scr_navgrid_occupy(occ_i, occ_j);

// electric grid
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, global.sensor_energy_consumption);

is_selected = false;
draw_cables = true;