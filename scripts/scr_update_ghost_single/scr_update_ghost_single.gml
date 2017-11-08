/// @arg i
/// @arg j
/// @arg construction_id	Not an instance
/// @arg rotation
var arg_i = argument0;
var arg_j = argument1;
var arg_construction_type = argument2;
var arg_rotation = argument3;

var construction = ds_map_find_value(global.construction_map, arg_construction_type);

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
	
	// sprite fix for syncing gates with draw tall walls
	switch(construction[macro_id])
	{
		case macro_door:
			if(arg_rotation == 0 || arg_rotation == 2)
			{
				if(!global.draw_tall_walls) sprite = spr_door;
				else sprite = spr_door_tall;
			}
			else
			{
				if(!global.draw_tall_walls) sprite = spr_door_vertical;
				else sprite = spr_door_tall_vertical;
			}
			break;
		case macro_hatch:
			if(arg_rotation == 0 || arg_rotation == 2)
			{
				if(!global.draw_tall_walls) sprite = spr_hatch;
				else sprite = spr_hatch_tall;
			}
			else
			{
				if(!global.draw_tall_walls) sprite = spr_hatch_vertical;
				else sprite = spr_hatch_tall_vertical;
			}
			break;
	}
	
	var tile_is_valid = scr_update_ghost_tile_with_overrides(target_i, target_j, actions_array, sprite, image, angle);
	
	if(tile_is_valid) {
		valid_tile_count++;
	}
}


var surround_actions = construction[macro_surround_actions];
if(is_array(surround_actions) && arg_construction_type == macro_basetile)
{
	var wall_sprite = spr_wall_tall;
	if(!global.draw_tall_walls) wall_sprite = spr_wall;
	scr_update_ghost_tile_with_overrides(arg_i - 1,	arg_j - 1,	surround_actions, wall_sprite,	9,	-1); // tl	ES	0+3
	scr_update_ghost_tile_with_overrides(arg_i,		arg_j - 1,	surround_actions, wall_sprite,	5,	-1); // t	EW	0+2
	scr_update_ghost_tile_with_overrides(arg_i + 1,	arg_j - 1,	surround_actions, wall_sprite,	12,	-1); // tr	WS	2+3
	scr_update_ghost_tile_with_overrides(arg_i - 1,	arg_j,		surround_actions, wall_sprite,	10,	-1); // l	NS	1+3
	scr_update_ghost_tile_with_overrides(arg_i + 1,	arg_j,		surround_actions, wall_sprite,	10,	-1); // r	NS	1+3
	scr_update_ghost_tile_with_overrides(arg_i - 1,	arg_j + 1,	surround_actions, wall_sprite,	3,	-1); // bl	EN	0+1
	scr_update_ghost_tile_with_overrides(arg_i,		arg_j + 1,	surround_actions, wall_sprite,	5,	-1); // b	EW	0+2
	scr_update_ghost_tile_with_overrides(arg_i + 1,	arg_j + 1,	surround_actions, wall_sprite,	6,	-1); // br	NW	1+2
}


// auto rotate door/hatch was here