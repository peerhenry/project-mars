/// @description Insert description here
// You can write your code in this editor
if(is_dragging){
	draw_set_colour(c_aqua);
	draw_rectangle(click_x, click_y, mouse_x, mouse_y, true);
}

if(global.construct != noone){
	/*var left = ((mouse_x-16) div 32)*32+16;
	var top = ((mouse_y-16) div 32)*32+16;
	var right = left + 32;
	var bottom = top + 32;
	draw_set_color(c_lime);
	draw_set_alpha(0.5);
	draw_rectangle(left, top, right, bottom, false);
	draw_set_alpha(1);*/
	scr_draw_ghost(mouse_x, mouse_y);
}