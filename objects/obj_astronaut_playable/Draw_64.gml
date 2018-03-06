if(show_details && false)
{	
	draw_set_font(font_small_bold);
	
	#region panel, avatar, name
	// panel
	var tl_x2 = tl_x + details_panel_width;
	var tl_y2 = tl_y + details_panel_height;
	scr_draw_panel(tl_x, tl_y, tl_x2, tl_y2);
	
	// avatar
	draw_set_color(c_black);
	var av_w = 96;
	var av_h = 96;
	var av_x = tl_x + details_panel_width - 16 - av_w;
	var av_y = tl_y + 16
	draw_rectangle(av_x, av_y, av_x + av_w, av_y + av_h, false);
	draw_sprite(spr_avatar, 0, av_x, av_y);
	
	// name
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var x_or = tl_x + 8;
	draw_text(x_or, tl_y + 16, name);
	var half_bar = 8;
	var bar_x_or = tl_x + 128;
	#endregion
	
	#region prop bars
	
	draw_set_valign(fa_middle);
	var counter = 0;
	var health_line_y = tl_y + 128 + counter*24;
	draw_text(x_or, health_line_y, "Health:");
	var hc = health_bar_color;
	if(entity_health < 20) hc = c_red;
	else if(entity_health < 50) hc = c_yellow;
	draw_healthbar(bar_x_or, health_line_y - half_bar, tl_x + width - 16, health_line_y + half_bar, entity_health, c_black, hc, hc, 0, true, true);
	counter++;
	
	if(wears_suit)
	{
		var oxygen_line_y = tl_y + 128 + counter*24;
		//var o2_seconds_remaining = ;
		draw_text(x_or, oxygen_line_y, "Oxygen: ");
		
		draw_healthbar(bar_x_or, oxygen_line_y - half_bar, tl_x + width - 16, oxygen_line_y + half_bar, suit_oxygen, c_black, oxygen_bar_color, oxygen_bar_color, 0, true, true);
	}
	counter++;
	
	var energy_line_y = tl_y + 128 + counter*24;
	draw_text(x_or, energy_line_y, "Sleep:");
	draw_healthbar(bar_x_or, energy_line_y - half_bar, tl_x + width - 16, energy_line_y + half_bar, sleep_level, c_black, sleep_bar_color, sleep_bar_color, 0, true, true);
	counter++;
	
	var food_line_y = tl_y + 128 + counter*24;
	draw_text(x_or, food_line_y, "Food:");
	draw_healthbar(bar_x_or, food_line_y - half_bar, tl_x + width - 16, food_line_y + half_bar, food_level, c_black, food_bar_color, food_bar_color, 0, true, true);
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
	if(debug_mode || global.dev_env)
	{
		var after_grid_y = grid_y + 128;
		draw_text(x_or, after_grid_y, "construction: " + string(construction));
		draw_text(x_or, after_grid_y+24, "current_action: " + scr_action_to_string(current_action));
		draw_text(x_or, after_grid_y+48, "assigned_object: " + string(assigned_object));
		draw_text(x_or, after_grid_y+72, "path_exists(path): " + string(path_exists(path)));
		draw_text(x_or, after_grid_y+96, "path_position: " + string(path_position));
		draw_text(x_or, after_grid_y+120, "target: " + string(target));
		draw_text(x_or, after_grid_y+144, "last_cancel_walking_result: " + string(last_cancel_walking_result));
		draw_text(x_or, after_grid_y+168, "path_index: " + string(path_index));
		draw_text(x_or, after_grid_y+192, "path: " + string(path));
		draw_text(x_or, after_grid_y+216, "path_positionprevious: " + string(path_positionprevious));
	}
	#endregion
	
	#region	auto tasks -- second panel
	
	// panel
	var atw = 4*32 + 2*8 + 3*4; // icons + padding + spacing
	var ath = 48;
	scr_draw_panel(gui_width - atw, gui_height - ath, gui_width, gui_height);
	
	// icons
	var counter = 0;
	var icon_top = gui_height - ath + 8;
	var icon_x_or = gui_width - atw + 8;
	draw_sprite(spr_auto_attack, auto_attack, icon_x_or + (32+4)*counter, icon_top);
	counter++;
	draw_sprite(spr_auto_construct, auto_construct, icon_x_or + (32+4)*counter, icon_top);
	counter++;
	draw_sprite(spr_auto_sleep, auto_sleep, icon_x_or + (32+4)*counter, icon_top);
	counter++;
	draw_sprite(spr_auto_feed, auto_eat, icon_x_or + (32+4)*counter, icon_top);
	
	#endregion
}