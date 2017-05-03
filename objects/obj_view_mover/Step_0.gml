/// @description Insert description here
// You can write your code in this editor

var camx = camera_get_view_x(cam);
var camy = camera_get_view_y(cam);
var camW = camera_get_view_width(cam);
var camH = camera_get_view_height(cam);

scroll_speed = 32;
var dx = 0;
var dy = 0;

// up
var moveUp = device_mouse_y_to_gui(0) < scroll_border || keyboard_check(ord("W"));
if(moveUp && camy >= scroll_speed ){
	dy += -scroll_speed;
}


// down
var moveDown = device_mouse_y_to_gui(0) > (camH - scroll_border) || keyboard_check(ord("S"));
if(moveDown && camy + camH < room_height - scroll_speed ){
	dy += scroll_speed;
}


// right
var moveRight = device_mouse_x_to_gui(0) > (camW-  scroll_border) || keyboard_check(ord("D"));
if(moveRight && camx + camW < room_width - scroll_speed ){
	dx += scroll_speed;
}

// left
var moveLeft = device_mouse_x_to_gui(0) < scroll_border || keyboard_check(ord("A"));
if(moveLeft && camx > scroll_speed ){
	dx += -scroll_speed;
}

if( dx != 0 || dy != 0){
	camera_set_view_pos(cam, camx + dx, camy + dy);
}