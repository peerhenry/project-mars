var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var clicked = mouse_check_button_released(mb_left);
var right_clicked = mouse_check_button_released(mb_right);

global.hovering_over_HUD = false;

// 1. menu button

mouse_over_menu = 
	window_mouse_x > menu_btn_left && 
	window_mouse_x < menu_btn_right && 
	window_mouse_y > menu_btn_top && 
	window_mouse_y < menu_btn_bottom;
	
if(mouse_over_menu)
{
	global.hovering_over_HUD = true;
	if(clicked)
	{
		var l = layer_get_id("logic");
		instance_create_layer(0, 0, l, obj_fade_to_menu);
	}
	return;
}


// todo: draw spr_cursor_attack if mouse does not hover over HUD...

if(global.hovering_over_HUD)
{
	cursor_sprite = spr_cursor;
	return;
}

var hovers_over_selectable = position_meeting(mouse_x, mouse_y, obj_astronaut_playable);

if(!hovers_over_selectable)
{
	hovers_over_selectable = position_meeting(mouse_x, mouse_y, obj_grid_selector);
}

if(!hovers_over_selectable)
{
	// Grid selectors, fridges and sensors are selectable
	if(scr_any_astronauts_selected())
	{
		var hovers_over_enemy = instance_position(mouse_x, mouse_y, obj_astronaut_enemy) != noone;
		if(!hovers_over_enemy)
		{
			var constr = scr_enemy_construction_position(mouse_x, mouse_y);
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