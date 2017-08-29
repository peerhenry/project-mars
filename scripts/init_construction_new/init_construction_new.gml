/// @param id
/// @param name
/// @param hud_sprite
/// @param action_count 

var arg_id = argument0;
var arg_name = argument1;
var arg_hud_sprite = argument2;
var arg_build_tiles = argument3;
var arg_category = argument4;

// default rotation behavior
var rotation_params;
rotation_params[macro_rotation_3] = init_new_draw_params_default();
rotation_params[macro_rotation_2] = init_new_draw_params_default();
rotation_params[macro_rotation_1] = init_new_draw_params_default();
rotation_params[macro_rotation_0] = init_new_draw_params_default();

var new_construction;
new_construction[macro_surround_actions] = noone;
new_construction[macro_dragging] = dragging.none;
new_construction[macro_drag_actions] = noone;
new_construction[macro_drag_params] = noone;
new_construction[macro_rotation_params] = rotation_params;
new_construction[macro_build_tiles] = arg_build_tiles;
new_construction[macro_hud_sprite] = arg_hud_sprite;
new_construction[macro_name] = arg_name;
new_construction[macro_id] = arg_id;
new_construction[macro_category] = arg_category;

global.init_active_construction = new_construction;
ds_map_add(global.construction_map, arg_id, new_construction);