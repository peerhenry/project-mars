/// @description Insert description here
// You can write your code in this editor
a = clamp(a + (fade*0.1), 0, 1);

if(a == 1)
{
	//var rname = room_get_name(room_menu);
	room_goto(room_menu);
	audio_stop_sound(global.current_song);
	fade = -1;
}

if(a == 0)
{
	instance_destroy();
}

draw_set_color(c_black);
draw_set_alpha(a);
//var x_or = view_xview[0];
//var y_or = view_yview[0];
var x_or = 0;
var y_or = 0;
draw_rectangle(
	x_or,
	y_or,
	x_or + scr_get_resolution_width(),
	y_or + scr_get_resolution_height(),
	false // rectangle is not outlined; it's filled
);

draw_set_alpha(1);