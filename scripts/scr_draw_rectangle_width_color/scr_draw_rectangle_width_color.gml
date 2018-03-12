/// @description scr_draw_rectangle_width_color(x1, y1, x2, y2, w, c, a)
/// @arg left
/// @arg top
/// @arg right
/// @arg bottom
/// @arg width
/// @arg color
/// @arg alpha
var x1 = argument0;
var y1 = argument1;
var x2 = argument2 - 1;
var y2 = argument3 - 1;
var w = argument4 - 1;
var c = argument5;
var a = argument6;

var org_a = draw_get_alpha();
draw_set_alpha(a);

draw_set_color(c);
draw_rectangle(x1, y1, x2, y1 + w, false); //top
draw_rectangle(x1, y2 - w, x2, y2, false); //bottom
draw_rectangle(x1, y1 + w, x1 + w, y2 - w, false); //left
draw_rectangle(x2 - w, y1 + w, x2, y2 - w, false); //right

draw_set_alpha(org_a);