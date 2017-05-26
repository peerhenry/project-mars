if(keyboard_check_pressed(vk_escape)){
	room_goto(0);
}
if(keyboard_check_pressed(ord("P"))){
	zoomed_in = !zoomed_in;
	if(zoomed_in){
		camera_set_view_size(view_camera[0], 960, 540);
	}
	else{
		camera_set_view_size(view_camera[0], 1920, 1080);
	}
}

if(keyboard_check_pressed(ord("R")))
{
	scr_increment_build_rotation(1);
}

if(keyboard_check_pressed(ord("Q")))
{
	global.draw_room_bb = !global.draw_room_bb;
}

if(keyboard_check_pressed(ord("T")))
{
	scr_run_tests();
}

if(keyboard_check_pressed(ord("B")))
{
	scr_debug_buffers();
}

if(keyboard_check_pressed(ord("N")))
{
	if(!global.music_is_playing)
	{
		global.music_is_playing = true;
	}
	else
	{
		audio_stop_sound(global.current_song);
	}
}

if(keyboard_check_pressed(ord("F")))
{
	var cq = global.construction_queue;
	var count = ds_list_size(cq);
	var temp_list = ds_list_create();
	ds_list_copy(temp_list, cq);
	for(var n = 0; n < count; n++)
	{
		var next_construction = ds_list_find_value(temp_list, n);
		scr_build_complete(next_construction);
	}
	ds_list_destroy(temp_list);
}

if(keyboard_check_pressed(ord("I")))
{
	var mouse_i = scr_rc_to_gi(mouse_x);
	var mouse_j = scr_rc_to_gi(mouse_y);
	var map_val = scr_map_buffer_get_cell(mouse_i, mouse_j);
	var map_i = map_val & 1;
	var map_o = (map_val >> 1) & 127;
	var map_r = (map_val >> 8) & 255;
	show_debug_message("map_i: " + string(map_i));
	show_debug_message("map_o: " + string(map_o));
	show_debug_message("map_r: " + string(map_r));
}