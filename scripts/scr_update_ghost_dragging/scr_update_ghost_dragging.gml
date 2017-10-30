/// @param i
/// @param j
/// @param origin_i
/// @param origin_j
/// @param diff_i
/// @param diff_j
/// @param abs_diff_i
/// @param abs_diff_j
/// @param build
/// @param rotation

var arg_i = argument0;
var arg_j = argument1;
var arg_origin_i = argument2;
var arg_origin_j = argument3;
var arg_diff_i = argument4;
var arg_diff_j = argument5;
var arg_abs_diff_i = argument6;
var arg_abs_diff_j = argument7;
var arg_build = argument8;
var arg_rotation = argument9;

var construction = ds_map_find_value(global.construction_map, arg_build);

var actions = construction[macro_drag_actions];

if(construction[macro_dragging] == dragging.rectangular)
{
	// rectangular

	// #region: set rectangle loop variables
	var i_left = arg_origin_i;
	var i_right = arg_i;
	if(arg_i < arg_origin_i)
	{
		i_left = arg_i;
		i_right = arg_origin_i;
	}
	
	var j_top = arg_origin_j;
	var j_bottom = arg_j;
	if(arg_j < arg_origin_j)
	{
		j_top = arg_j;
		j_bottom = arg_origin_j;
	}
	// #end region: set rectangle loop variables
	
	for(var ni = i_left; ni <= i_right; ni++)
	{
		for(var nj = j_top; nj <= j_bottom; nj++)
		{
			scr_update_ghost_tile_with_overrides(ni, nj, actions, -1, -1, 0);
		}
	}
	
	// surrounder
	var surround_actions = construction[macro_surround_actions];
	if(is_array(surround_actions))
	{
		var sprite_override = 0;
		var image_override = 0;
		var angle_override = 0;
	
		if(arg_build == macro_basetile)
		{
			if(!global.draw_tall_walls) sprite_override = spr_wall;
		}
	
		// 4 corners
		scr_update_ghost_tile_with_overrides(i_left-1, j_top-1, surround_actions, sprite_override, 9, angle_override);
		scr_update_ghost_tile_with_overrides(i_right+1, j_top-1, surround_actions, sprite_override, 12, angle_override);
		scr_update_ghost_tile_with_overrides(i_left-1, j_bottom+1, surround_actions, sprite_override, 3, angle_override);
		scr_update_ghost_tile_with_overrides(i_right+1, j_bottom+1, surround_actions, sprite_override, 6, angle_override);
			
		// sides
		for(var ni = i_left; ni <= i_right; ni++)
		{
			scr_update_ghost_tile_with_overrides(ni, j_top-1, surround_actions, sprite_override, 5, angle_override);
			scr_update_ghost_tile_with_overrides(ni, j_bottom+1, surround_actions, sprite_override, 5, angle_override);
		}
	
		for(var nj = j_top; nj <= j_bottom; nj++)
		{
			scr_update_ghost_tile_with_overrides(i_left-1, nj, surround_actions, sprite_override, 10, angle_override);
			scr_update_ghost_tile_with_overrides(i_right+1, nj, surround_actions, sprite_override, 10, angle_override);
		}
	}
}
else
{
	// linear
	
	if(arg_abs_diff_i > arg_abs_diff_j)
	{
		// horizontal
		var drag_params = construction[macro_drag_params];
		
		var left_params = drag_params[macro_drag_left];
		var left_sprite = left_params[macro_sprite];
		var left_image = left_params[macro_image];
		var left_angle = left_params[macro_angle];
		
		var right_params = drag_params[macro_drag_right];
		var right_sprite = right_params[macro_sprite];
		var right_image = right_params[macro_image];
		var right_angle = right_params[macro_angle];
		
		var horizontal_params = drag_params[macro_drag_horizontal];
		var horizontal_sprite = horizontal_params[macro_sprite];
		var horizontal_image = horizontal_params[macro_image];
		var horizontal_angle = horizontal_params[macro_angle];
		
		var i_left = arg_origin_i + min(0, arg_diff_i);
		var i_right = arg_origin_i + max(arg_diff_i, 0);
		scr_update_ghost_tile_with_overrides(i_left, arg_origin_j, actions, left_sprite, left_image, left_angle);
		scr_update_ghost_tile_with_overrides(i_right, arg_origin_j, actions, right_sprite, right_image, right_angle);
		for(var n = i_left + 1; n < i_right; n++)
		{
			scr_update_ghost_tile_with_overrides(n, arg_origin_j, actions, horizontal_sprite, horizontal_image, horizontal_angle);
		}
	}
	else
	{
		// vertical
		var drag_params = construction[macro_drag_params];
		
		var top_params = drag_params[macro_drag_top];
		var top_sprite = top_params[macro_sprite];
		var top_image = top_params[macro_image];
		var top_angle = top_params[macro_angle];
		
		var bottom_params = drag_params[macro_drag_bottom];
		var bottom_sprite = bottom_params[macro_sprite];
		var bottom_image = bottom_params[macro_image];
		var bottom_angle = bottom_params[macro_angle];
		
		var vertical_params = drag_params[macro_drag_vertical];
		var vertical_sprite = vertical_params[macro_sprite];
		var vertical_image = vertical_params[macro_image];
		var vertical_angle = vertical_params[macro_angle];
		
		var j_top = arg_origin_j + min(0, arg_diff_j);
		var j_bottom = arg_origin_j + max(arg_diff_j, 0);
		scr_update_ghost_tile_with_overrides(arg_origin_i, j_top, actions, top_sprite, top_image, top_angle);
		scr_update_ghost_tile_with_overrides(arg_origin_i, j_bottom, actions, bottom_sprite, bottom_image, bottom_angle);
		for(var n = j_top + 1; n < j_bottom; n++)
		{
			scr_update_ghost_tile_with_overrides(arg_origin_i, n, actions, vertical_sprite, vertical_image, vertical_angle);
		}
	}
}

/*switch(arg_build)
{
	case macro_wall:
		scr_drag_wall(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9);
		break;
	case macro_basetile:
		scr_drag_basetile(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9);
		break;
	case macro_pipe:
		scr_drag_pipe(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9);
		break;
	case macro_cable:
		scr_drag_cable(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9);
		break;
}*/