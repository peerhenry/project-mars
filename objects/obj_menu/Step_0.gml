/// @description Check for menu events

if(global.room_is_transitioning) exit;

var move = 0;
move -= max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), 0);
move += max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")), 0);

// set menu_focus_index
if(move != 0){
	menu_focus_index += move;
	if(menu_focus_index < 0 ) menu_focus_index = array_length_1d(menu) - 1;
	else if(menu_focus_index >= array_length_1d(menu) ) menu_focus_index = 0;
}

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

if(keyboard_check_pressed(vk_escape)) event_user(1);