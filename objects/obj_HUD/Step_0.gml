if(global.mousedrag_from == mousedrag_from.world) exit; //prevent hover when dragging into from outside

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var pressed = mouse_check_button_pressed(mb_left);
var released = mouse_check_button_released(mb_left);
var right_clicked = mouse_check_button_released(mb_right);
mouse_over_HUD = window_mouse_y < 36; // hud top bar

#region buttons

hover_button = noone;
for(var n = 0; n < ds_list_size(buttons); n++)
{
	var button = buttons[| n];
	var hover = 
		window_mouse_x > button.left
		&& window_mouse_x < button.right
		&& window_mouse_y > button.top
		&& window_mouse_y < button.bottom
	if(hover)
	{
		hovers = true;
		hover_button = button;
		if(pressed) press_button = button;
		else if(released) scr_hud_button_click(button);
	}
	if(press_button == button && released) press_button = noone;
}

#endregion

if( mouse_over_HUD || global.hovering_over_HUD )
{
	cursor_sprite = spr_cursor;
	exit;
}

#region set cursor
// ---  Check hovers over selectable 

// hovers over movable
var hovers_over_selectable = false;
var entity = instance_position(mouse_x, mouse_y, obj_movable);
if(entity != noone)
{
	hovers_over_selectable = entity.owner == macro_player;
}

// hovers over grid selector
var component = noone;
if(!hovers_over_selectable)
{
	component = instance_position(mouse_x, mouse_y, obj_base_component);
	if(component != noone)
	{
		hovers_over_selectable = (component.owner == macro_player);
	}
}

// --- End Check hovers over selectable

if(!hovers_over_selectable)
{
	// Grid selectors, fridges and sensors are selectable
	if( scr_any_task_actors_selected() )
	{
		var hovers_over_enemy = false;
		if(entity != noone)
		{
			hovers_over_enemy = entity.owner == macro_enemy;
		}

		if(!hovers_over_enemy)
		{
			var constr = scr_enemy_component_position(mouse_x, mouse_y);
			if(constr != noone) hovers_over_enemy = true;
		}
		
		if(hovers_over_enemy)
		{
			cursor_sprite = spr_cursor_attack;
		}
		else
		{
			/*
			var hovers_over_assignable = instance_position(mouse_x, mouse_y, obj_assignable) != noone;
			if(hovers_over_assignable)
			{
				cursor_sprite = spr_cursor_assign;
			}
			else */
			cursor_sprite = spr_cursor_move;
		}
	}
	else cursor_sprite = spr_cursor;
}
else // hovers over selectable
{
	if(scr_any_task_actors_selected())
	{
		if(component != noone && scr_instance_inherits(component, obj_assignable))
		{
			cursor_sprite = spr_cursor_assign;
		}
	}
	else
	{
		if(component != noone && scr_instance_inherits(component, obj_gate))
		{
			if(!component.locked)
			{
				if(component.is_open) cursor_sprite = spr_gate_close;
				else cursor_sprite = spr_gate_open;
			}
			else cursor_sprite = spr_cursor;
		}
		else cursor_sprite = spr_cursor_select;
	}
}

#endregion