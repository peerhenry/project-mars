/// @description Check for menu events

if(global.room_is_transitioning) exit;

// set menu_focus_index via mouse hover
if(last_mouse_x != mouse_x || last_mouse_y != mouse_y) //mouse has moved
{
	last_mouse_x = mouse_x;
	last_mouse_y = mouse_y;
	for(var m = 0; m < array_length_1d(menu); m++)
	{
		var caption = menu[m];
		var cx = x + space;
		var cy = y + m * space;
		var cw = string_width(caption + " ");
		var ch = string_height(caption);
		
		//if(mouse_x > cx && mouse_x < cx + cw && mouse_y > cy && mouse_y < cy + ch) menu_focus_index = m; //exact hover
		if(mouse_y > cy && mouse_y < cy + ch) menu_focus_index = m; //only check y-coordinate hover
	}
}

// set menu_focus_index via keyboard arrows //todo: refactor hardcoded bindings?
var move = 0;
move -= max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), 0);
move += max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")), 0);
if(move != 0)
{
	menu_focus_index += move;
	if(menu_focus_index < 0 ) menu_focus_index = array_length_1d(menu) - 1;
	else if(menu_focus_index >= array_length_1d(menu) ) menu_focus_index = 0;
}

// Select focussed menu item
if(!mark_for_go)
{
	mark_for_go = max(keyboard_check_pressed(vk_enter), keyboard_check_pressed(vk_space), mouse_check_button_pressed(mb_left), 0);
}
else
{
	var keys_clear = !(max(keyboard_check(vk_enter), keyboard_check(vk_space), mouse_check_button(mb_left), 0));
	if(keys_clear)
	{
		mark_for_go = false;
		event_user(0);
	}
}

// Escape current menu
if(keyboard_check_pressed(vk_escape)) event_user(1);