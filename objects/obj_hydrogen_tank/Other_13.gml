/// @description Init
event_inherited();

scr_navgrid_occupy(occ_i, occ_j);

// oxygen grid
scr_set_new_grid_props(id, macro_grid_hydrogen, macro_grid_role_storage, 100);

depth = -occ_j;

grid_type_to_select = macro_grid_oxygen;
max_value = 100;