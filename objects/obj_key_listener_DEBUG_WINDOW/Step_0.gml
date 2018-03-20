if(keyboard_check_pressed(vk_pageup)) //increase resolution
{
	scr_force_trace("Increase resolution");
	global.resolutions_current++;
	if(global.resolutions_current >= ds_list_size(global.resolutions_list)) global.resolutions_current = 0; //reset to first item
	var new_resolution = global.resolutions_list[|global.resolutions_current];
	scr_set_window(new_resolution[0], new_resolution[1], global.window_fullscreen, global.window_aa_level, global.window_vsync, -1, -1, noone);
}
if(keyboard_check_pressed(vk_pagedown)) //decrease resolution
{
	global.resolutions_current--;
	if(global.resolutions_current < 0) global.resolutions_current = ds_list_size(global.resolutions_list) - 1; //reset to last item
	var new_resolution = global.resolutions_list[|global.resolutions_current];
	scr_set_window(new_resolution[0], new_resolution[1], global.window_fullscreen, global.window_aa_level, global.window_vsync, -1, -1, noone);
}
if(keyboard_check_pressed(vk_home)) //Toggle fullscreen
{
	scr_force_trace("Toggle fullscreen");
	scr_set_window(global.window_width, global.window_height, !global.window_fullscreen, global.window_aa_level, global.window_vsync, -1, -1, noone);
}
if(keyboard_check_pressed(vk_end)) //Debug actual window info
{
	debug_window_info();
}
if(keyboard_check_pressed(vk_delete)) //Reset window to known values
{
	scr_force_trace("Reset window to known values");
	scr_set_window(global.window_width, global.window_height, global.window_fullscreen, global.window_aa_level, global.window_vsync, -1, -1, noone);
}
if(room == room_window_test && keyboard_check_pressed(vk_escape))
{
	//todo: when opened from ingame, return to persistent room
	room_goto(room_menu);
}