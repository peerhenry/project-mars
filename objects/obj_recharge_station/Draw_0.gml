/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(!under_construction && has_power)
{
	draw_set_colour(c_aqua);
	draw_set_alpha(0.3);
	var ro_x = x - 16;
	var ro_y = y - 16;
	draw_rectangle(ro_x+32, ro_y, ro_x+64, ro_y+32, false);
	draw_rectangle(ro_x, ro_y+32, ro_x+32, ro_y+64, false);
	draw_rectangle(ro_x-32, ro_y, ro_x, ro_y+32, false);
	draw_rectangle(ro_x, ro_y-32, ro_x+32, ro_y, false);
	draw_set_alpha(1.0);
}