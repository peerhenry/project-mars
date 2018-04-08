/// @arg mouse_listener
var arg_mouse_listener = argument0;

// 1 construction
var constr_type = scr_get_selected_constr_type();
if(constr_type != noone)
{
	scr_lr_with_construction();
	arg_mouse_listener.is_dragging = false;
	exit;
}

// 2 dragging
if(arg_mouse_listener.is_dragging)
{
	scr_handle_left_drag_released(arg_mouse_listener);
	exit;
}

// 3 click on map
if( instance_exists(global.hud_details_panel) )
{
	instance_destroy(global.hud_details_panel);
	global.hud_details_panel = noone;
}

// 3.1 click on movable
var click_ent = instance_position(mouse_x, mouse_y, obj_movable);
var clicked_selectable = click_ent != noone && click_ent.owner == macro_player;
if(clicked_selectable)
{
	scr_lr_on_movable(click_ent);
	exit;
}

// 3.2 click on base component
var click_bc = instance_position(mouse_x, mouse_y, obj_base_component);
var clicked_base_component = (click_bc != noone && click_bc.owner == macro_player);
if(clicked_base_component)
{
	scr_lr_on_base_component(click_bc);
	exit;
}

// 3.3 click on no selectable
scr_lr_on_nothing();