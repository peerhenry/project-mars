draw_self();

if(under_construction) exit;

var water_grid = scr_get_grid(id, macro_grid_water);

if(water_grid.net_output > 0)
{
	var wp_height = floor((water_grid.net_output/10)*8);
	if(wp_height > 8) wp_height = 8;
	if(image_index & 2 == 0) water_rectangle_top = y - 4 - wp_height;
	
	var max_alpha = 0.8;
	var alpha = (water_grid.net_output/10)*max_alpha;
	if(alpha > max_alpha) alpha = max_alpha;
	draw_set_alpha(alpha);
	
	draw_set_color($dfa440); // bgr
	draw_rectangle(water_rectangle_left, water_rectangle_top, water_rectangle_right, water_rectangle_bottom, false);
	draw_set_alpha(1);
}