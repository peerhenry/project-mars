var width = 384;
var height = 424;
var tl_x = display_get_gui_width() - width;
var tl_y = 0;

if(show_details)
{
	// panel
	var tl_x2 = tl_x + width;
	var tl_y2 = tl_y + height;
	scr_draw_panel(tl_x, tl_y, tl_x2, tl_y2);
	
	// avatar
	draw_set_color(c_black);
	var av_w = 96;
	var av_h = 96;
	var av_x = tl_x + width - 16 - av_w;
	var av_y = tl_y + 16
	draw_rectangle(av_x, av_y, av_x + av_w, av_y + av_h, false);
	draw_sprite(spr_avatar, 0, av_x, av_y);
	
	// text
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var x_or = tl_x + 8;
	draw_text(x_or, tl_y + 16, name);
	var half_bar = 8;
	var bar_x_or = tl_x + 128;
	
	draw_set_valign(fa_middle);
	var health_line_y = tl_y + 128;
	draw_text(x_or, health_line_y, "Health");
	draw_healthbar(bar_x_or, health_line_y - half_bar, tl_x + width - 16, health_line_y + half_bar, astronaut_health, 0, c_red, c_green, 0, false, false);
	
	var oxygen_line_y = tl_y + 128 + 24;
	var o2_seconds_remaining = 
	draw_text(x_or, oxygen_line_y, "Oxygen: ");
	draw_healthbar(bar_x_or, oxygen_line_y - half_bar, tl_x + width - 16, oxygen_line_y + half_bar, suit_oxygen, 0, c_red, c_blue, 0, false, false);
	
	var energy_line_y = tl_y + 128 + 48;
	draw_text(x_or, energy_line_y, "Energy");
	draw_healthbar(bar_x_or, energy_line_y - half_bar, tl_x + width - 16, energy_line_y + half_bar, energy, 0, c_red, c_yellow, 0, false, false);
	
	var food_line_y = tl_y + 128 + 72;
	draw_text(x_or, food_line_y, "Food");
	draw_healthbar(bar_x_or, food_line_y - half_bar, tl_x + width - 16, food_line_y + half_bar, food_level, 0, c_red, c_olive, 0, false, false);
	
	
	/*
	var next_line_y = tl_y + 128 + 96;
	draw_text(x_or, next_line_y, "Is walking: " + string(is_walking)); // DEBUG
	*/
	
	//draw_text(x_or, food_line_y, "Inventory");
	
	// inventory
	var grid_x = x_or + 96;
	var grid_y = tl_y + 128 + 96;
	draw_sprite(spr_inventory_grid, 0, grid_x, grid_y);
	
	for (var i=0; i<3; i++)
    {
        for (var j=0; j<3; j++)
        {
            var value = ds_grid_get(inventory,i,j);
			if(value != macro_inventory_empty && value != macro_inventory_occupied)
			{
				var sprite = scr_get_inventory_item_sprite(value);
				draw_sprite(sprite, 0, grid_x + 32*i, grid_y + 32*j);
			}
        }
    }
}