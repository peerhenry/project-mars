/// @arg origin_x
/// @arg origin_y
/// @arg mouse_x
/// @arg mouse_y
/// @arg construction_id
/// @arg is_dragging
var arg_origin_x = argument0;
var arg_origin_y = argument1;
var arg_mouse_x = argument2;
var arg_mouse_y = argument3;
var arg_construction_id = argument4;
var arg_is_dragging = argument5;
var script_container = global.script_container;

if(arg_construction_id != macro_destruct_safe)
{
	exit;
}

var basetile = instance_position(arg_mouse_x, arg_mouse_y, obj_base_tile);
if(basetile == noone)
{
	var wall = instance_position(arg_mouse_x, arg_mouse_y, obj_wall);
	if(wall == noone)
	{
		var target_i = scr_rc_to_gi(arg_mouse_x);
		var target_j = scr_rc_to_gi(arg_mouse_y);
		ds_stack_push(global.invalid_ghost_stack, target_i, target_j, noone);
		global.construction_is_valid = false;
		exit;
	}
	else scr_update_ghost_destruct_safe(script_container, wall);
}
else scr_update_ghost_destruct_safe(script_container, basetile);