var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var clicked = mouse_check_button_released(mb_left);
var right_clicked = mouse_check_button_released(mb_right);
mouse_over_HUD = false;

flash_counter = flash_counter + 1;
if(flash_counter == 30) flash_counter = 0;

#region buttons

for(var n = 0; n < ds_list_size(buttons); n++)
{
	var button = buttons[| n];
	var hovers = 
		window_mouse_x > button[? "left"] 
		&& window_mouse_x < button[? "right"]
		&& window_mouse_y > button[? "top"] 
		&& window_mouse_y < button[? "bottom"];
	if(hovers && clicked) scr_execute_hud_action(button);
}

#endregion

#region menu button

mouse_over_menu = 
	window_mouse_x > menu_btn_left && 
	window_mouse_x < menu_btn_right && 
	window_mouse_y > menu_btn_top && 
	window_mouse_y < menu_btn_bottom;
	
if(mouse_over_menu)
{
	mouse_over_HUD = true;
	if(clicked)
	{
		with(gui_menu){
			event_user(0); // toggle menu
		}
		with(obj_gui_menu)
		{
			if(id != other.gui_menu) event_user(1); // close other menus
		}
	}
	exit;
}

#endregion

if( mouse_over_HUD || global.hovering_over_HUD )
{
	cursor_sprite = spr_cursor;
	exit;
}

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
			var hovers_over_assignable = instance_position(mouse_x, mouse_y, obj_assignable) != noone;
			if(hovers_over_assignable)
			{
				cursor_sprite = spr_cursor_assign;
			}
			else cursor_sprite = spr_cursor_move;
		}
	}
	else cursor_sprite = spr_cursor;
}
else
{
	cursor_sprite = spr_cursor_select;
}