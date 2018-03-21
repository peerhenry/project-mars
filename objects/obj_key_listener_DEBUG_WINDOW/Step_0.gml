if(keyboard_check_pressed(vk_pageup)) //increase resolution
{
	scr_force_trace("Increase resolution");
	var list = global.window[? key_window_resolutions_list];
	var current = ++global.window[? key_window_resolutions_current]; //increment one
	if(current >= ds_list_size(list)) current = global.window[? key_window_resolutions_current] = 0; //reset to first item
	var new_size = list[|current];
	scr_set_window(new_size[0], new_size[1], -1, -1, -1, -1, -1, noone);
}
if(keyboard_check_pressed(vk_pagedown)) //decrease resolution
{
	scr_force_trace("Decrease resolution");
	var list = global.window[? key_window_resolutions_list];
	var current = --global.window[? key_window_resolutions_current]; //decrement one
	if(current < 0) current = global.window[? key_window_resolutions_current] = ds_list_size(list); //reset to last item
	var new_size = list[|current];
	scr_set_window(new_size[0], new_size[1], -1, -1, -1, -1, -1, noone);
}
if(keyboard_check_pressed(vk_home)) //Toggle fullscreen
{
	scr_force_trace("Toggle fullscreen");
	scr_set_window(-1, -1, -2, -1, -1, -1, -1, noone);
}
if(keyboard_check_pressed(vk_end)) //Debug actual window info
{
	debug_window_info();
}
if(keyboard_check_pressed(vk_delete)) //Reset window to known values
{
	scr_force_trace("Reset window to known values");
	scr_set_window(-1, -1, -1, -1, -1, -1, -1, noone);
}
if(room == room_window_test && keyboard_check_pressed(vk_escape))
{
	//todo: when opened from ingame, return to persistent room (e.g.: globals.previous_room_index?)
	room_goto(room_menu);
}