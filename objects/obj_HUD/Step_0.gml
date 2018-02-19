var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var clicked = mouse_check_button_released(mb_left);
var right_clicked = mouse_check_button_released(mb_right);
mouse_over_HUD = false;

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
		with(hud_menu){
			event_user(0); // toggle menu
		}
		with(obj_HUD_menu)
		{
			if(id != other.hud_menu) event_user(1); // close other menus
		}
	}
	exit;
}

#endregion

#region astro panels

var offset = 0;
var hover_over_ap = false;
var panel_selected_astro = noone;
var details_astro = noone;
with(obj_astronaut_playable)
{
	var ap_left = other.ap_origin_left;
	var ap_right = ap_left + other.ap_w;
	var ap_top = other.ap_origin_top + offset;
	var ap_bottom = ap_top + other.ap_h;
	hover_over_ap = 
		window_mouse_x > ap_left && 
		window_mouse_x < ap_right && 
		window_mouse_y > ap_top && 
		window_mouse_y < ap_bottom;
		
	if(hover_over_ap)
	{
		other.mouse_over_HUD = true;
		if(clicked)
		{
			// check if any auto button was clicked
			
			var counter = 0;
			var icon_x_or = other.ap_origin_left + other.ap_name_w + 2 * other.ap_padding;
			var icon_offset = (16 + other.ap_padding);
			
			var next_icon_left = icon_x_or;
			if(window_mouse_x <= next_icon_left) panel_selected_astro = id;
			else
			{
				if(window_mouse_x > next_icon_left && window_mouse_x < next_icon_left + 16) auto_attack = !auto_attack;
				next_icon_left = next_icon_left + icon_offset;
				if(window_mouse_x > next_icon_left && window_mouse_x < next_icon_left + 16) auto_construct = !auto_construct;
				next_icon_left = next_icon_left + icon_offset;
				if(window_mouse_x > next_icon_left && window_mouse_x < next_icon_left + 16) auto_sleep = !auto_sleep;
				next_icon_left = next_icon_left + icon_offset;
				if(window_mouse_x > next_icon_left && window_mouse_x < next_icon_left + 16) auto_eat = !auto_eat;
			}
		}
		else if(right_clicked)
		{
			details_astro = id;
		}
		break;
	}
	offset = offset + other.ap_offset;
}
if(panel_selected_astro != noone)
{
	with(obj_astronaut_playable)
	{
		if(id == panel_selected_astro) is_selected = true;
		else is_selected = false;
	}
	scr_play_selection_sound();
	exit;
}
else if(details_astro != noone)
{
	with(obj_astronaut_playable)
	{
		if(id == details_astro) show_details = true;
		else show_details = false;
	}
	exit;
}

#endregion

if(mouse_over_HUD || global.hovering_over_HUD)
{
	cursor_sprite = spr_cursor;
	exit;
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