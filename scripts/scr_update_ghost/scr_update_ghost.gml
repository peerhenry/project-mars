/// @arg origin_x
/// @arg origin_y
/// @arg mouse_x
/// @arg mouse_y
/// @arg construction_id
/// @arg rotation
/// @arg is_dragging
var arg_origin_x = argument0;
var arg_origin_y = argument1;
var arg_mouse_x = argument2;
var arg_mouse_y = argument3;
var arg_construction_id = argument4;
var arg_rotation = argument5;
var arg_is_dragging = argument6;

var end_i = scr_rc_to_gi(arg_mouse_x);
var end_j = scr_rc_to_gi(arg_mouse_y);

// OBSOLETE
/*var mouse_hovers_over_new_cell = (end_i != global.ghost_previous_i || end_j != global.ghost_previous_j);
if(mouse_hovers_over_new_cell)
{
	global.ghost_previous_i = end_i;
	global.ghost_previous_j = end_j;
	global.rotated_was_checked = false;	// for auto rotate hatches and doors
}*/

// clear the ghost stack
scr_ghost_reset();

var construction = ds_map_find_value(global.construction_map, arg_construction_id);

if(arg_construction_id == macro_destruct_safe || arg_construction_id == macro_destruct_room)
{
	scr_update_ghost_destruct(arg_origin_x, arg_origin_y, arg_mouse_x, arg_mouse_y, arg_construction_id, arg_is_dragging);
	exit;
}

// first check dragging
var ghost_was_dragging = false;
if(arg_is_dragging && construction[macro_dragging] != dragging.none)
{
	var origin_i = scr_rc_to_gi(arg_origin_x);
	var origin_j = scr_rc_to_gi(arg_origin_y);
	var diff_i = end_i - origin_i;
	var diff_j = end_j - origin_j;
	var abs_diff_i = abs(diff_i);
	var abs_diff_j = abs(diff_j);
	var diff_is_significant = abs_diff_i  > 0 || abs_diff_j > 0;

	if(diff_is_significant)
	{
		scr_update_ghost_dragging(
			end_i, end_j, 
			origin_i, origin_j, 
			diff_i, diff_j,
			abs_diff_i, abs_diff_j,
			arg_construction_id, arg_rotation
		);
		ghost_was_dragging = true;
	}
}

// if no dragging, do regular update ghost
if(!ghost_was_dragging) scr_update_ghost_single(end_i, end_j, arg_construction_id, arg_rotation);

if(global.total_cost > global.resource_amount_metal)
{
	global.can_pay_for_construction = false;
}