if(under_construction)
{
	event_inherited();
	exit;
}

draw_self();

var water_grid = scr_get_grid(id, macro_grid_water);

#macro macro_water_a_weak 0.2
#macro macro_water_a_strong 0.6

if(water_grid.storage_capacity > 0)
{
	var storage_level = (water_grid.storage/water_grid.storage_capacity);
	var wp_height = floor(storage_level*8);
	if(wp_height > 8) wp_height = 8;
	if(image_index & 2 == 0) water_rectangle_top = y - 4 - wp_height;
	
	var alpha = 0;
	if(storage_level > 0)
	{
		alpha = storage_level*(macro_water_a_strong - macro_water_a_weak) + macro_water_a_weak;
		if(alpha > macro_water_a_strong) alpha = macro_water_a_strong;
	}
	draw_set_alpha(alpha);
	
	draw_set_color($dfa440); // bgr
	draw_rectangle(water_rectangle_left, water_rectangle_top, water_rectangle_right, water_rectangle_bottom, false);
	draw_set_alpha(1);
}