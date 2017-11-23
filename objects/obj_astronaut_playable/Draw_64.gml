if ( show_details )
{
	var width = 384;
	var height = 32 + 16 + 24*5 + 64*3 + 96;// padding + spaces + lines + inventory + avatar
	var display_width = display_get_gui_width();
	var display_height = display_get_gui_height();
	var tl_x = display_width - width;
	var tl_y = 0;
	
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
	
	#region prop bars
	
	draw_set_valign(fa_middle);
	var counter = 0;
	var health_line_y = tl_y + 128 + counter*24;
	draw_text(x_or, health_line_y, "Health");
	draw_healthbar(bar_x_or, health_line_y - half_bar, tl_x + width - 16, health_line_y + half_bar, astronaut_health, 0, c_red, c_green, 0, false, false);
	counter++;
	
	if(wears_suit)
	{
		var oxygen_line_y = tl_y + 128 + counter*24;
		//var o2_seconds_remaining = ;
		draw_text(x_or, oxygen_line_y, "Oxygen: ");
		draw_healthbar(bar_x_or, oxygen_line_y - half_bar, tl_x + width - 16, oxygen_line_y + half_bar, suit_oxygen, 0, c_red, c_blue, 0, false, false);
		counter++;
	}
	
	var energy_line_y = tl_y + 128 + counter*24;
	draw_text(x_or, energy_line_y, "Energy");
	draw_healthbar(bar_x_or, energy_line_y - half_bar, tl_x + width - 16, energy_line_y + half_bar, energy, 0, c_red, c_yellow, 0, false, false);
	counter++;
	
	var food_line_y = tl_y + 128 + counter*24;
	draw_text(x_or, food_line_y, "Food");
	draw_healthbar(bar_x_or, food_line_y - half_bar, tl_x + width - 16, food_line_y + half_bar, food_level, 0, c_red, c_olive, 0, false, false);
	counter++;
	
	#endregion prop bars
	
	#region inventory
	
	var inv_line_y = tl_y + 128 + counter*24;
	draw_text(x_or, inv_line_y, "Inventory");
	counter++;
	
	var grid_x = x_or + 96;
	var grid_y = tl_y + 128 + counter*24;
	draw_sprite(spr_inventory_grid, 0, grid_x, grid_y);
	
	for (var i=0; i<3; i++)
    {
        for (var j=0; j<3; j++)
        {
            var value = ds_grid_get(inventory,i,j);
			if(value != macro_inventory_empty && value != macro_inventory_occupied)
			{
				var sprite = scr_get_inventory_item_sprite(value);
				draw_sprite(sprite, 0, grid_x + 64*i, grid_y + 64*j);
			}
        }
    }
	
	#endregion
	
	#region debug info
	if(debug_mode)
	{
		var after_grid_y = grid_y + 128;
		draw_text(x_or, after_grid_y, "construction: " + string(construction));
		draw_text(x_or, after_grid_y+24, "current_action: " + scr_action_to_string(current_action));
		draw_text(x_or, after_grid_y+48, "assigned_object: " + string(assigned_object));
		draw_text(x_or, after_grid_y+72, "is_walking: " + string(is_walking));
		draw_text(x_or, after_grid_y+96, "path_position: " + string(path_position));
	}
	#endregion
	
	#region	auto tasks -- second panel
	
	// panel
	var atw = 4*32 + 2*8 + 3*4; // icons + padding + spacing
	var ath = 48;
	scr_draw_panel(display_width - atw, display_height - ath, display_width, display_height);
	
	// icons
	var counter = 0;
	var icon_top = display_height - ath + 8;
	var icon_x_or = display_width - atw + 8;
	draw_sprite(spr_auto_attack, auto_attack, icon_x_or + (32+4)*counter, icon_top);
	counter++;
	draw_sprite(spr_auto_construct, auto_construct, icon_x_or + (32+4)*counter, icon_top);
	counter++;
	draw_sprite(spr_auto_sleep, auto_sleep, icon_x_or + (32+4)*counter, icon_top);
	counter++;
	draw_sprite(spr_auto_feed, auto_eat, icon_x_or + (32+4)*counter, icon_top);
	
	#endregion
}