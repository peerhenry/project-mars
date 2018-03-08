draw_set_font(font_small);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

// draw robot tab
var c_top = c_dkgray;
var c_bottom = c_black;
if(hover_astro_tab)
{
	c_top = c_gray;
	//c_bottom = c_dkgray;
}
draw_rectangle_color(tab_astro_left, tab_astro_top, tab_astro_right, tab_astro_top + tab_h, c_top, c_top, c_bottom, c_bottom, false)
draw_set_color(c_white);
draw_text(text_left, tab_astro_top + text_y_offset, "astronauts (" + string(astro_count) + ")");

// draw robot tab
c_top = c_dkgray;
c_bottom = c_black;
if(hover_robot_tab)
{
	c_top = c_gray;
	//c_bottom = c_dkgray;
}
draw_rectangle_color(tab_robot_left, tab_robot_top, tab_robot_right, tab_robot_top + tab_h, c_top, c_top, c_bottom, c_bottom, false)
draw_set_color(c_white);
draw_text(text_left, tab_robot_top + text_y_offset, "robots (" + string(robot_count) + ")");

// draw cart tab
c_top = c_dkgray;
c_bottom = c_black;
if(hover_cart_tab)
{
	c_top = c_gray;
	//c_bottom = c_dkgray;
}
draw_rectangle_color(tab_cart_left, tab_cart_top, tab_cart_right, tab_cart_top + tab_h, c_top, c_top, c_bottom, c_bottom, false)
draw_set_color(c_white);
draw_text(text_left, tab_cart_top + text_y_offset, "carts (" + string(cart_count) + ")");