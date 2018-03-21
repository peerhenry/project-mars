event_inherited();
name = "oxygen tank";
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

// oxygen grid
scr_set_new_grid_props(id, macro_grid_oxygen, macro_grid_role_storage, 100);

depth = -occ_j;

grid_type_to_select = macro_grid_oxygen; // todo: obsolete, remove, and should also refactor away the grid selector object
max_value = 100; // todo: move to config and init_globals

var level = scr_get_grid_prop(id, macro_grid_oxygen, macro_grid_storage_level);