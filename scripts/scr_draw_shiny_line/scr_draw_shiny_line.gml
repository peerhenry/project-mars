/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg color
var arg_x1 = argument0;
var arg_y1 = argument1;
var arg_x2 = argument2;
var arg_y2 = argument3;
var arg_color = argument4;

var a_org = draw_get_alpha();

draw_set_alpha(0.2);
draw_line_width_color(arg_x1, arg_y1, arg_x2, arg_y2, 3, arg_color, arg_color);
draw_set_alpha(0.5);
draw_line_width_color(arg_x1, arg_y1, arg_x2, arg_y2, 1, arg_color, arg_color);

draw_set_alpha(a_org);