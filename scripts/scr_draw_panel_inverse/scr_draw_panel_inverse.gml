/// @param x_left
/// @param y_top
/// @param x_right
/// @param y_bottom

draw_set_color(c_dkgray);
draw_set_alpha(0.8);
draw_rectangle(argument0, argument1, argument2, argument3, false);
	
draw_set_color(c_black);
draw_line(argument0, argument1, argument2, argument1);
draw_line(argument0, argument1, argument0, argument3);
	
draw_set_color(c_ltgray);
draw_line(argument2, argument1, argument2, argument3);
draw_line(argument0, argument3, argument2, argument3);

draw_set_alpha(1);