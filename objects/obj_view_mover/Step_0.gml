if(mouse_check_button(mb_middle))
{
	exit; //don't propagate view movement when dragging the map outside window with middle mouse
} //todo: don't start scrolling after releasing middle btn outside window (only scroll when cursor exactly at specific border region?)

var camx = camera_get_view_x(cam);
var camy = camera_get_view_y(cam);
var camW = camera_get_view_width(cam);
var camH = camera_get_view_height(cam);
var viewW = view_wport[0];
var viewH = view_hport[0];

scroll_speed = 32;
var dx = 0;
var dy = 0;

// up
var moveUp = device_mouse_y_to_gui(0) < scroll_border || keyboard_check(ord("W")) || keyboard_check(vk_up);
if(moveUp && camy >= scroll_speed ){
	dy += -scroll_speed;
}


// down
var moveDown = device_mouse_y_to_gui(0) > (viewH - scroll_border) || keyboard_check(ord("S")) || keyboard_check(vk_down);
if(moveDown && camy + camH < room_height - scroll_speed ){
	dy += scroll_speed;
}


// right
var moveRight = device_mouse_x_to_gui(0) > (viewW-  scroll_border) || keyboard_check(ord("D")) || keyboard_check(vk_right);
if(moveRight && camx + camW < room_width - scroll_speed ){
	dx += scroll_speed;
}

// left
var moveLeft = device_mouse_x_to_gui(0) < scroll_border || keyboard_check(ord("A")) || keyboard_check(vk_left);
if(moveLeft && camx > scroll_speed ){
	dx += -scroll_speed;
}

if( dx != 0 || dy != 0){
	camera_set_view_pos(cam, camx + dx, camy + dy);
}