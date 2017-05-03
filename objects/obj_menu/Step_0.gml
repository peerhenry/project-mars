/// @description Insert description here
// You can write your code in this editor
var move = 0;
move -= max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), 0);
move += max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")), 0);

if(move != 0){
	menu_focus_index += move;
	if(menu_focus_index < 0 ) menu_focus_index = menu_index_max;
	else if(menu_focus_index > menu_index_max ) menu_focus_index = 0;
}

if(!mark_for_go){
	mark_for_go = max(keyboard_check_pressed(vk_enter), keyboard_check_pressed(vk_space), mouse_check_button_pressed(mb_left), 0);
}
else {
	var keys_clear = !(max(keyboard_check(vk_enter), keyboard_check(vk_space), mouse_check_button(mb_left), 0));
	if(keys_clear)
	{
		mark_for_go = false;
		scr_menu();	
	}
}

if(keyboard_check_pressed(vk_escape)) game_end();