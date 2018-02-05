var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var clicked = mouse_check_button_released(mb_left);
var right_clicked = mouse_check_button_released(mb_right);

// 1. menu button

mouse_over_menu = 
	window_mouse_x > menu_btn_left && 
	window_mouse_x < menu_btn_right && 
	window_mouse_y > menu_btn_top && 
	window_mouse_y < menu_btn_bottom;
	
if(mouse_over_menu)
{
	global.hovering_over_hud_panel = true;
	if(clicked)
	{
		with(hud_menu){
			event_user(0); // toggle menu
		}
		with(obj_HUD_menu)
		{
			if(id != other.hud_menu) event_user(1); // close other menus
		}
	}
	return;
}


// todo: draw spr_cursor_attack if mouse does not hover over HUD...

if(global.hovering_over_HUD)
{
	cursor_sprite = spr_cursor;
	return;
}

// hovers over astronaut
var hovers_over_selectable = false;
var astro = instance_position(mouse_x, mouse_y, obj_astronaut);
if(astro != noone)
{
	hovers_over_selectable = astro.owner == macro_player;
}

// hovers over grid selector
if(!hovers_over_selectable)
{
	var selector = instance_position(mouse_x, mouse_y, obj_grid_selector);
	if(selector != noone)
	{
		hovers_over_selectable = (selector.owner == macro_player);
	}
}

if(!hovers_over_selectable)
{
	// Grid selectors, fridges and sensors are selectable
	if(scr_any_astronauts_selected())
	{
		var hovers_over_enemy = false;
		if(astro != noone)
		{
			hovers_over_enemy = astro.owner == macro_enemy;
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