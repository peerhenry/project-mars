/// @description Insert description here
// You can write your code in this editor

tiles = ds_list_create();
doors = ds_list_create();
hatches = ds_list_create(); // if there is more one or more hatches, the room is an airlock.

bb_left = 0;
bb_right = 0;
bb_top = 0;
bb_bottom = 0;

oxygen_level = 100;	// 100%
oxygen_is_leaking = false;
oxygen_is_replenishing = true; // only if there is no oxygen drainage
temperature = 20; // 20 degrees celsius
hatch_o2_drainage_for_one_tile = global.gate_drainage_speed;
o2_replenishment = 0.1; // percentage replenishment

grid_props_map = ds_map_create();
scr_set_new_grid_props(id, macro_grid_oxygen, macro_grid_role_consumer, 0);
scr_set_grid_prop(id, macro_grid_oxygen, macro_grid_prop_can_perform_role, true);

// scr_set_grid_prop(id, macro_grid_oxygen, macro_grid_role_consumer, 0);