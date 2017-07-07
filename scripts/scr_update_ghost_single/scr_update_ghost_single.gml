var arg_i = argument0;
var arg_j = argument1;
var arg_construction_id = argument2;
var arg_rotation = argument3;

var construction = ds_map_find_value(global.construction_map, arg_construction_id);
var build_tiles = construction[macro_build_tiles];

var build_coords;

var valid_tile_count = 0;
// loop over build tiles

for(var n = 0; n < array_length_1d(build_tiles); n++)
{	
	var next_build_tile = build_tiles[n];	
	var di = next_build_tile[macro_build_tile_di];
	var dj = next_build_tile[macro_build_tile_dj];
	var actions_array = next_build_tile[macro_build_tile_actions];
	
	// show_debug_message("di: " + string(di) + " dj: " + string(dj));
	
	var rot_i = di;
	var rot_j = dj;
	if(arg_rotation == 1)
	{
		rot_i = dj;
		rot_j = -di;
	}
	else if(arg_rotation == 2)
	{
		rot_i = -di;
		rot_j = -dj;
	}
	else if(arg_rotation == 3)
	{
		rot_i = -dj;
		rot_j = di;
	}
	
	var target_i = arg_i + rot_i;
	var target_j = arg_j + rot_j;
	
	//var tile_is_valid = scr_update_ghost_tile(target_i, target_j, actions_array, arg_rotation);
	var rotation_params = construction[macro_rotation_params];
	var draw_params = rotation_params[arg_rotation];
	var sprite = draw_params[macro_sprite];
	var image = draw_params[macro_image];
	var angle = draw_params[macro_angle];
	
	var tile_is_valid = scr_update_ghost_tile_with_overrides(target_i, target_j, actions_array, sprite, image, angle);
	
	if(tile_is_valid) {
		valid_tile_count++;
	}
}

// surrounder actions; assumed to always be wall
var surround_actions = construction[macro_surround_actions];
if(is_array(surround_actions)){
	
	scr_update_ghost_tile_with_overrides(arg_i - 1,	arg_j - 1,	surround_actions, spr_wall_edge,		-1, 90);
	scr_update_ghost_tile_with_overrides(arg_i,		arg_j - 1,	surround_actions, spr_wall_straight,	-1, -1);
	scr_update_ghost_tile_with_overrides(arg_i + 1,	arg_j - 1,	surround_actions, spr_wall_edge,		-1, -1);
	scr_update_ghost_tile_with_overrides(arg_i - 1,	arg_j,		surround_actions, spr_wall_straight,	-1, 90);
	scr_update_ghost_tile_with_overrides(arg_i + 1,	arg_j,		surround_actions, spr_wall_straight,	-1, 90);
	scr_update_ghost_tile_with_overrides(arg_i - 1,	arg_j + 1,	surround_actions, spr_wall_edge,		-1, 180);
	scr_update_ghost_tile_with_overrides(arg_i,		arg_j + 1,	surround_actions, spr_wall_straight,	-1, -1);
	scr_update_ghost_tile_with_overrides(arg_i + 1,	arg_j + 1,	surround_actions, spr_wall_edge,		-1, 270);
	
}

// auto rotate door or hatch was here