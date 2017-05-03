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