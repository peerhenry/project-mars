var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var clicked = mouse_check_button_released(mb_left);
var right_clicked = mouse_check_button_released(mb_right);
mouse_over_HUD = false;

flash_counter = flash_counter + 1;
if(flash_counter == 30) flash_counter = 0;

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

if(double_click_timer > 0) double_click_timer = double_click_timer - 1;
var offset = 0;
var hover_over_ap = false;
var panel_selected_astro = noone;
var details_astro = noone;
hover_part = hud_part.none;
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
		other.hover_astro = id;
		
		// determine what part mouse hovers over
		var icon_x_or = other.ap_origin_left + other.ap_name_w + 2 * other.ap_padding;
		var next_icon_left = icon_x_or;
		var icon_offset = (16 + other.ap_padding);
		if(window_mouse_x > next_icon_left && window_mouse_x < next_icon_left + 16) other.hover_part = hud_part.auto_attack;
		next_icon_left = next_icon_left + icon_offset;
		if(window_mouse_x > next_icon_left && window_mouse_x < next_icon_left + 16) other.hover_part = hud_part.auto_construct;
		next_icon_left = next_icon_left + icon_offset;
		if(window_mouse_x > next_icon_left && window_mouse_x < next_icon_left + 16) other.hover_part = hud_part.auto_sleep;
		next_icon_left = next_icon_left + icon_offset;
		if(window_mouse_x > next_icon_left && window_mouse_x < next_icon_left + 16) other.hover_part = hud_part.auto_eat;
		var bw = 3;
		var bspace = 5;
		// food_level bar
		var name_x = other.ap_origin_left + other.ap_padding;
		var hbx = name_x + other.ap_name_w - bw;
		if(window_mouse_x > hbx-1 && window_mouse_x < hbx + bw + 1) other.hover_part = hud_part.food_bar;
		// sleep bar
		hbx = hbx - bspace - bw;
		if(window_mouse_x > hbx-1 && window_mouse_x < hbx + bw + 1) other.hover_part = hud_part.sleep_bar;
		// oxygen bar
		if(wears_suit)
		{
			hbx = hbx - bspace - bw;
			if(window_mouse_x > hbx-1 && window_mouse_x < hbx + bw + 1) other.hover_part = hud_part.oxygen_bar;
		}
		
		if(clicked)
		{
			// check if any auto button was clicked
			if(window_mouse_x <= icon_x_or) panel_selected_astro = id;
			else
			{
				if(other.hover_part == hud_part.auto_attack) auto_attack = !auto_attack;
				else if(other.hover_part == hud_part.auto_construct) auto_construct = !auto_construct;
				else if(other.hover_part == hud_part.auto_sleep) auto_sleep = !auto_sleep;
				else if(other.hover_part == hud_part.auto_eat) auto_eat = !auto_eat;
			}
		}
		else if(right_clicked)
		{
			details_astro = id;
		}
		break;
	}
	else other.hover_astro = noone;
	
	offset = offset + other.ap_offset;
}
if(panel_selected_astro != noone)
{
	var add_to_selection = keyboard_check(vk_shift) || keyboard_check(vk_control);
	
	scr_hide_all_panels();
	if(double_click_timer > 0 && double_click_astro == panel_selected_astro)
	{
		var cam = view_camera[0];
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
		var new_x = panel_selected_astro.x - cam_w/2;
		var new_y = panel_selected_astro.y - cam_h/2;
		scr_set_cam_pos_safe(new_x, new_y);
	}
	else
	{
		double_click_timer = 10;
		double_click_astro = panel_selected_astro;
		with(obj_astronaut_playable)
		{
			if(id == panel_selected_astro)
			{
				if(add_to_selection) is_selected = !is_selected;
				else is_selected = true;
				if(is_selected) scr_play_selection_sound();
			}
			else if(!add_to_selection) is_selected = false;
		}
	}
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
	var selector = instance_position(mouse_x, mouse_y, obj_grid_selector);
	if(selector != noone)
	{
		hovers_over_selectable = (selector.owner == macro_player);
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