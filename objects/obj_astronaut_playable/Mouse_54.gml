var gui_menu_active = false;
with(obj_gui_menu) gui_menu_active = is_active;
if(show_details && !gui_menu_active)
{
	// check if clicked on grid
	var window_mouse_y = window_mouse_get_y();
	var window_mouse_x = window_mouse_get_x();
	
	var x_or = tl_x + 8;
	var grid_x = x_or + 96;
	var grid_y = tl_y + 128 + 5*24; // 5 lines before inventory
	draw_sprite(spr_inventory_grid, 0, grid_x, grid_y);
	
	var cell_size = 64;
	for (var i=0; i<2; i++)
    {
        for (var j=0; j<2; j++)
        {
            var value = ds_grid_get(inventory, i, j);
			if(value == macro_inventory_food)
			{
				if(
					window_mouse_x > grid_x + cell_size * i &&
					window_mouse_x < grid_x + cell_size * (i+2) &&
					window_mouse_y > grid_y + cell_size * j &&
					window_mouse_y < grid_y + cell_size * (j+2)
				)
				{
					scr_eat(id);
				}
			}
        }
    }
}