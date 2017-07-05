var arg_i = argument0;
var arg_j = argument1;
var arg_construction_id = argument2;
var arg_rotation = argument3;

var active_construction = ds_map_find_value(global.construction_map, arg_construction_id);
var build_tile_keys = active_construction[macro_build_tile_keys];

if(!is_array(build_tile_keys)){
	show_error("build_tile_keys is not an array!", true);
}

var build_coords;

var valid_tile_count = 0;
// loop over build tiles
for(var n = 0; n < array_length_1d(build_tile_keys); n++)
{
	//buffer_seek(build_tile_buffer, buffer_seek_start, tile_offset + n*global.props_per_build_tile*4);
	
	var next_key = build_tile_keys[n];
	var build_tile_map = active_construction[macro_build_tile_map];
	var actions_array = ds_map_find_value(build_tile_map, next_key);	// gets the array of actions for the tile
	
	var di = next_key >> 16;
	var dj = next_key & 2047;
	
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
	
	// todo: refactor to use the surrounder
	/*if(arg_construction_id == construction.basetile && (di != 0 || dj != 0)) // wall for basetile
	{
		var sprite = spr_wall_straight;
		var angle = 0;
		var nr = (dj)*3 + di + 4;
		switch(nr)
		{
			case 0:		// di = -1, dj = -1
				sprite = spr_wall_edge;
				angle = 90;
				break;
			case 2:		// di = 1, dj = -1
				sprite = spr_wall_edge;
				break;
			case 3:		// di = -1, dj = 0
			case 5:		// di = 1, dj = 0
				angle = 90;
				break;
			case 6:		// di = -1, dj = 1
				sprite = spr_wall_edge;
				angle = 180;
				break;
			case 8:		// di = 1, dj = 1
				sprite = spr_wall_edge;
				angle = 270;
				break;
		}
		scr_update_ghost_tile_with_overrides(arg_i + di, arg_j + dj, actions_array, arg_rotation, sprite, -1, angle);
	}
	else
	{
		var tile_is_valid = scr_update_ghost_tile(target_i, target_j, actions_array, arg_rotation);
		if(tile_is_valid) valid_tile_count++;
	}*/
	
	var tile_is_valid = scr_update_ghost_tile(target_i, target_j, actions_array, arg_rotation);
	if(tile_is_valid) {
		valid_tile_count++;
	}
}

// surrounder actions; assumed to always be wall
var surround_actions = active_construction[macro_surround_actions];
if(is_array(surround_actions)){
	
	scr_update_ghost_tile_with_overrides(arg_i - 1,	arg_j - 1,	surround_actions, 0, spr_wall_edge,		-1, 90);
	scr_update_ghost_tile_with_overrides(arg_i,		arg_j - 1,	surround_actions, 0, spr_wall_straight, -1, -1);
	scr_update_ghost_tile_with_overrides(arg_i + 1,	arg_j - 1,	surround_actions, 0, spr_wall_edge,		-1, -1);
	scr_update_ghost_tile_with_overrides(arg_i - 1,	arg_j,		surround_actions, 0, spr_wall_straight, -1, 90);
	scr_update_ghost_tile_with_overrides(arg_i + 1,	arg_j,		surround_actions, 0, spr_wall_straight, -1, 90);
	scr_update_ghost_tile_with_overrides(arg_i - 1,	arg_j + 1,	surround_actions, 0, spr_wall_edge,		-1, 180);
	scr_update_ghost_tile_with_overrides(arg_i,		arg_j + 1,	surround_actions, 0, spr_wall_straight, -1, -1);
	scr_update_ghost_tile_with_overrides(arg_i + 1,	arg_j + 1,	surround_actions, 0, spr_wall_edge,		-1, 270);
	
}

// auto rotate door or hatch was here