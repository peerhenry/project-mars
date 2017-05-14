/// @description Insert description here
// You can write your code in this editor
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
	global.build_rotation++;
	if(global.build_rotation == 4) global.build_rotation = 0;
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