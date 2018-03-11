var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var clicked = mouse_check_button_released(mb_left);
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
		if(clicked) scr_execute_hud_action(button);
		break;
	}
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
if(!hovers_over_selectable)
{
	var component = instance_position(mouse_x, mouse_y, obj_base_component);
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
		var hovers_over_assignable = instance_position(mouse_x, mouse_y, obj_assignable) != noone;
		if(hovers_over_assignable)
		{
			cursor_sprite = spr_cursor_assign;
		}
	}
	else cursor_sprite = spr_cursor_select;
}

#endregion