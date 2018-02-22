if(global.hovering_over_HUD)
{
	is_dragging	= false;
	exit; // HUD clicks must not propagate here.
}

#region SET DRAGGING

if(mouse_check_button_pressed(mb_left))
{
	click_x = mouse_x;
	click_y = mouse_y;
}
	
// Drag
var drag_released = false;
var left_released = false;

if(mouse_check_button(mb_left))
{
	// larger than 5 pixels
	var sig_x = abs(mouse_x - click_x) > 5;
	var sig_y = abs(mouse_y - click_y) > 5;
	if(sig_x || sig_y)
	{
		is_dragging	= true;
	}
	else
	{
		is_dragging	= false;
	}
}

#endregion

#region CONSTRUCTION INPUT

var constr_type = scr_get_selected_constr_type();
if(constr_type != noone) // BUILD MODE
{
	// Left pressed: set click origin and hide astronaut panels
	if(mouse_check_button_pressed(mb_left))
	{
		scr_hide_all_panels();
	}
	
	// Place new construction on left release
	if(mouse_check_button_released(mb_left))
	{
		scr_build_new();
		is_dragging	= false;
	}
	
	var rot = global.construction_ghost[? macro_ghost_rotation];
	scr_update_ghost(click_x, click_y, mouse_x, mouse_y, constr_type, rot, is_dragging);
	
	// exit BUILD MODE on RIGHT CLICK
	if(mouse_check_button_pressed(mb_right))
	{
		scr_ghost_reset();
		scr_hide_categories();
	}
	
	exit;
}
#endregion

#region ASTRONAUT SELECT/ORDERS INPUT

var just_selected_any_entity = false;
var selection_includes_astro = false;

if( !is_dragging )
{
	// LEFT CLICK: set click origin for dragging
	if( mouse_check_button_pressed(mb_left) )
	{
		scr_hide_categories(); // hide construction menu
	}
	
	if( mouse_check_button_released(mb_right) )
	{
		// deselect everything
		scr_hide_categories();
		var hover_actor = instance_position(mouse_x, mouse_y, obj_task_actor);
		if(
			hover_actor != noone
			&& object_is_ancestor(hover_actor.object_index, obj_astronaut)
			&& hover_actor.owner = macro_player
		)
		{
			scr_hide_all_panels();
			hover_actor.show_details = true;
		}
		else scr_command(mouse_x, mouse_y);
	}
	
	// Left release & not dragging
	// Either select 1 astronaut or command selected astronauts
	if(mouse_check_button_released(mb_left))
	{
		scr_handle_left_released();
	}
}
else if(mouse_check_button_released(mb_left)) // - DRAG SELECT
{
	scr_handle_left_drag_released();
}

#endregion