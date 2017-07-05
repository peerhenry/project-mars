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

var active_construction = ds_map_find_value(global.construction_map, arg_build);

var actions = active_construction[macro_drag_actions];

if(active_construction[macro_dragging] == dragging.rectangular)
{
	// #region: set rectangle loop variables
	var next_i = arg_origin_i;
	var next_j = arg_origin_j;
	
	var i_increment = 1;
	var i_count = arg_i - arg_origin_i;
	var i_left = arg_origin_i - 1;
	var i_right = arg_i + 1;
	
	if(arg_i < arg_origin_i)
	{
		i_increment = -1;
		i_count = arg_origin_i - arg_i;
		i_left = arg_i - 1;
		i_right = arg_origin_i + 1;
	}
	
	var j_increment = 1;
	var j_count = arg_j - arg_origin_j;
	var j_top = arg_j + 1;
	var j_bottom = arg_origin_j - 1;
		
	if(arg_j < arg_origin_j)
	{
		j_increment = -1;
		j_count = arg_origin_j - arg_j;
		j_top = arg_origin_j + 1 ;
		j_bottom = arg_j - 1;
	}
	// #end region: set rectangle loop variables
	
	for(var ni = 0; ni <= i_count; ni++)
	{
		next_j = arg_origin_j;
		for(var nj = 0; nj <= j_count; nj++)
		{
			scr_update_ghost_tile(next_i, next_j, actions, arg_rotation);
			next_j = next_j + j_increment;
		}
		next_i = next_i + i_increment;
	}
	
	// surrounder
	var surround_actions = active_construction[macro_surround_actions];
	if(is_array(surround_actions))
	{
		var next_i = arg_origin_i;
		var next_j = arg_origin_j;
		
		// 4 corners
		scr_update_ghost_tile_with_overrides(
			arg_origin_i - 1, arg_origin_j - 1, 
			surround_actions, arg_rotation, spr_wall_edge, 0, 90);
		scr_update_ghost_tile_with_overrides(
			arg_origin_i + i_count + 1, arg_origin_j - 1,  
			surround_actions, arg_rotation, spr_wall_edge, 0, 0);
		scr_update_ghost_tile_with_overrides(
			arg_origin_i - 1, arg_origin_j + j_count + 1, 
			surround_actions, arg_rotation, spr_wall_edge, 0, 180);
		scr_update_ghost_tile_with_overrides(
			arg_origin_i + i_count + 1, arg_origin_j + j_count + 1, 
			surround_actions, arg_rotation, spr_wall_edge, 0, 270);
		
		// sides
		for(var ni = 0; ni <= i_count; ni++)
		{
			scr_update_ghost_tile_with_overrides(next_i, arg_origin_j-1, surround_actions, arg_rotation, spr_wall_straight, 0, 0);
			scr_update_ghost_tile_with_overrides(next_i, arg_origin_j + j_count + 1, surround_actions, arg_rotation, spr_wall_straight, 0, 0);
			next_i = next_i + i_increment;
		}
	
		for(var nj = 0; nj <= j_count; nj++)
		{
			scr_update_ghost_tile_with_overrides(arg_origin_i - 1, next_j, surround_actions, arg_rotation, spr_wall_straight, 0, 90);
			scr_update_ghost_tile_with_overrides(arg_origin_i + i_count + 1, next_j, surround_actions, arg_rotation, spr_wall_straight, 0, 90);
			next_j = next_j + j_increment;
		}
	}
}
else
{
	// linear
	
	if(arg_abs_diff_i > arg_abs_diff_j)
	{
		// horizontal wall
		var i_left = arg_origin_i + min(0, arg_diff_i);
		var i_right = arg_origin_i + max(arg_diff_i, 0);
		scr_update_ghost_tile_with_overrides(i_left, arg_origin_j, actions, arg_rotation, -1, -1, 180);
		scr_update_ghost_tile_with_overrides(i_right, arg_origin_j, actions, arg_rotation, -1, -1, 0);
		for(var n = i_left + 1; n < i_right; n++)
		{
			scr_update_ghost_tile_with_overrides(n, arg_origin_j, actions, arg_rotation, -1, -1, 0);
		}
	}
	else
	{
		// vertival wall
		var j_top = arg_origin_j + min(0, arg_diff_j);
		var j_bottom = arg_origin_j + max(arg_diff_j, 0);
		scr_update_ghost_tile_with_overrides(arg_origin_i, j_top, actions, arg_rotation, -1, -1, 90);
		scr_update_ghost_tile_with_overrides(arg_origin_i, j_bottom, actions, arg_rotation, -1, -1, 270);
		for(var n = j_top + 1; n < j_bottom; n++)
		{
			scr_update_ghost_tile_with_overrides(arg_origin_i, n, actions, arg_rotation, -1, -1, 90);
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