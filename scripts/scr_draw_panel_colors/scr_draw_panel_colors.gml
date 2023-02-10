/// @param x_left
/// @param y_top
/// @param x_right
/// @param y_bottom
/// @param col_body
/// @param col_top
/// @param col_bottom
/// @param alpha
function scr_draw_panel_colors(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var arg_col_body = argument4;
	var arg_col_top = argument5;
	var arg_col_bottom = argument6;

	draw_set_color(arg_col_body);
	draw_set_alpha(argument7);
	draw_rectangle(argument0, argument1, argument2, argument3, false);
	
	draw_set_color(arg_col_top);
	draw_line(argument0, argument1, argument2, argument1);
	draw_line(argument0, argument1, argument0, argument3);

	draw_set_color(arg_col_bottom);
	draw_line(argument2, argument1, argument2, argument3);
	draw_line(argument0, argument3, argument2, argument3);

	draw_set_alpha(1);


}
