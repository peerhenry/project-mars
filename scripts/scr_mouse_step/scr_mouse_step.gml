/// @arg mouse_listener
var arg_mouse_listener = argument0;

scr_mouse_step_set_dragging(arg_mouse_listener);

// update ghost
var constr_type = scr_get_selected_constr_type();
if(constr_type != noone)
{
	var rot = global.construction_ghost[? macro_ghost_rotation];
	scr_update_ghost(arg_mouse_listener.click_x, arg_mouse_listener.click_y, mouse_x, mouse_y, constr_type, rot, arg_mouse_listener.is_dragging);
}

#region CONSTRUCTION INPUT -- OBSOLETE

/* old way, todo: move & remove
var constr_type = scr_get_selected_constr_type();
if(constr_type != noone) // BUILD MODE
{	
	var rot = global.construction_ghost[? macro_ghost_rotation];
	scr_update_ghost(click_x, click_y, mouse_x, mouse_y, constr_type, rot, is_dragging);
	
	if(!global.cart_deploy_mode)
	{
		// Place new construction on left release
		if(mouse_check_button_released(mb_left))
		{
			scr_build_new();
			is_dragging	= false;
		}
	
		// exit BUILD MODE on RIGHT CLICK
		if(mouse_check_button_pressed(mb_right))
		{
			scr_ghost_reset();
		}
		
		exit;
	}
}
*/

#endregion

if(mouse_check_button_released(mb_left)) scr_handle_left_released(arg_mouse_listener);
else if( mouse_check_button_released(mb_right) ) scr_handle_right_released();