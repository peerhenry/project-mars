var arg_origin_x = argument0;
var arg_origin_y = argument1;
var arg_mouse_x = argument2;
var arg_mouse_y = argument3;
var arg_build = argument4;
var arg_rotation = argument5;
var arg_is_dragging = argument6;

var end_i = scr_rc_to_gi(arg_mouse_x);
var end_j = scr_rc_to_gi(arg_mouse_y);

// clear the build stack
ds_stack_clear(global.build_stack);
global.total_cost = 0;

if(!arg_is_dragging)
{
	scr_draw_ghost_single(end_i, end_j, arg_build, arg_rotation);
}
else
{
	var origin_i = scr_rc_to_gi(arg_origin_x);
	var origin_j = scr_rc_to_gi(arg_origin_y);
	var diff_i = end_i - origin_i;
	var diff_j = end_j - origin_j;
	var abs_diff_i = abs(diff_i);
	var abs_diff_j = abs(diff_j);
	var diff_is_significant = abs_diff_i  > 0 || abs_diff_j > 0;

	if(diff_is_significant && scr_build_is_draggable(arg_build))
	{
		scr_draw_ghost_dragging(
			end_i, end_j, 
			origin_i, origin_j, 
			diff_i, diff_j,
			abs_diff_i, abs_diff_j,
			arg_build, arg_rotation
		);
	}
	else
	{
		scr_draw_ghost_single(end_i, end_j, arg_build, arg_rotation);
	}
}

if(global.total_cost > global.resource_amount_metal)
{
	global.construction_is_valid = false;
}