/// @description Insert description here
// You can write your code in this editor

if(unit != noone) // draw details panel
{
	#region panel & top buttons
	
	if(hover_deselect)
	{
		if(mouse_check_button(mb_left)) scr_draw_panel_inverse(deselect_button_left, deselect_button_top, deselect_button_right, deselect_button_bottom);
		else scr_draw_panel_light(deselect_button_left, deselect_button_top, deselect_button_right, deselect_button_bottom);
	}
	else scr_draw_panel(deselect_button_left, deselect_button_top, deselect_button_right, deselect_button_bottom);
	draw_sprite(spr_deselect_icon, 0, deselect_button_left + 4, deselect_button_top + 4);
	
	if(hover_center)
	{
		if(mouse_check_button(mb_left)) scr_draw_panel_inverse(center_cam_button_left, center_cam_button_top, center_cam_button_right, center_cam_button_bottom);
		else scr_draw_panel_light(center_cam_button_left, center_cam_button_top, center_cam_button_right, center_cam_button_bottom);
	}
	else scr_draw_panel(center_cam_button_left, center_cam_button_top, center_cam_button_right, center_cam_button_bottom);
	draw_sprite(spr_center_cam_icon, 0, center_cam_button_left + 4, center_cam_button_top + 4);
	
	scr_draw_panel(left, top, right, bottom);
	
	#endregion
	
	#region avatar
	draw_set_color(c_black);
	var av_w = 96;
	var av_h = 96;
	var av_x = left + width - padding - av_w;
	var av_y = top + padding;
	draw_rectangle(av_x, av_y, av_x + av_w, av_y + av_h, false);
	var avatar = scr_get_avatar(unit);
	if( scr_instance_inherits(unit, obj_astronaut) ) draw_sprite(avatar, 0, av_x, av_y);
	else draw_sprite_ext(avatar, 0, av_x + av_w/2, av_y + av_h/2, 1, 1, 0, c_white, 1.0);
	#endregion 
	
	#region name
	draw_set_font(font_hud);
	var name_size = font_get_size(font_hud);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var x_or = left + padding;
	draw_text(x_or, top + padding, unit.name);
	#endregion 
	
	#region health / integrity
	var hb_left = left + padding;
	var hb_top = top + 2 * padding + name_size;
	var hb_right = right - 2*padding - 96;
	var hb_bottom = hb_top + 4;
	
	var h = 0;
	if(scr_instance_inherits(unit, obj_movable)) h = unit.entity_health;
	else h = 100 - unit.damage;
	
	var hc = c_lime;
	if(h < 20) hc = c_red;
	else if(h < 50) hc = c_yellow;
	
	draw_healthbar(hb_left, hb_top, hb_right, hb_bottom, h, c_black, hc, hc, 0, true, true);
	
	var next_y_offset = top + 2*padding + 96;
	#endregion 
	
	#region needs / grid props
	var prop_font = font_small_bold;
	draw_set_font(prop_font);
	var font_height = font_get_size(prop_font)
	var line_height = font_height + 12;
	
	if(scr_instance_inherits(unit, obj_movable))
	{
		var bar_height = 4;
		
		var bar_left = hb_left + 100;
		var bar_top = next_y_offset + (font_height - bar_height)/2;
		var bar_right = right - padding;
		var bar_bottom = bar_top + bar_height;
		
		if(scr_instance_inherits(unit, obj_astronaut)) // draw need bars
		{
			// oxygen
			if(unit.wears_suit)
			{
				draw_text(x_or, next_y_offset, "Oxygen " + string(floor(unit.suit_oxygen)) + "%");
				draw_healthbar(bar_left, bar_top, bar_right, bar_bottom, unit.suit_oxygen, c_black, oxygen_bar_color, oxygen_bar_color, 0, true, true);
				next_y_offset += line_height;
			}
			
			// sleep
			bar_top = next_y_offset + (font_height - bar_height)/2;
			draw_text(x_or, next_y_offset, "Sleep ");
			draw_healthbar(bar_left, bar_top, bar_right, bar_top + bar_height, unit.sleep_level, c_black, sleep_bar_color, sleep_bar_color, 0, true, true);
			next_y_offset += line_height;
			
			// food
			bar_top = next_y_offset + (font_height - bar_height)/2;
			draw_text(x_or, next_y_offset, "Food ");
			draw_healthbar(bar_left, bar_top, bar_right, bar_top + bar_height, unit.food_level, c_black, food_bar_color, food_bar_color, 0, true, true);
			next_y_offset += line_height;
		}
		else
		{
			// battery charge
			bar_top = next_y_offset + (font_height - bar_height)/2;
			draw_text(x_or, next_y_offset, "Battery " + string(floor(unit.battery_charge)) + "%");
			draw_healthbar(bar_left, bar_top, bar_right, bar_top + bar_height, unit.battery_charge, c_black, c_aqua, c_aqua, 0, true, true);
			next_y_offset += line_height;
		}
	}
	else if(scr_instance_inherits(unit, obj_constructable)) // grid props
	{
		var tab = 100;
		// grid - role - value
		for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
		{
			//var grid_props = scr_get_grid_props(arg_instance, grid_type);
			if(scr_has_grid_props(unit, grid_type))
			{
				var grid_string = "electric";
				switch(grid_type)
				{
					case macro_grid_electric: grid_string = "electric"; break;
					case macro_grid_water: grid_string = "water"; break;
					case macro_grid_oxygen: grid_string = "oxygen"; break;
					case macro_grid_hydrogen: grid_string = "hydrogen"; break;
				}
				draw_text(x_or, next_y_offset, grid_string + " grid");
				
				var role_s = "";
				var role = scr_get_grid_prop(unit, grid_type, macro_grid_prop_role);
				switch(role)
				{
					case macro_grid_role_carrier: role_s = "carrier"; break;
					case macro_grid_role_source: role_s = "source"; break;
					case macro_grid_role_consumer: role_s = "consumer"; break;
					case macro_grid_role_storage: role_s = "storage"; break;
				}
				draw_text(x_or + tab, next_y_offset, "role: " + role_s);
				
				var val = scr_get_grid_prop(unit, grid_type, macro_grid_prop_value);
				draw_text(x_or + 2*tab, next_y_offset, "value: " + string(val));
				next_y_offset += line_height;
			}
		}
	}
	#endregion 
	
	#region inventory
	var inv_sprite = noone;
	if(scr_instance_inherits(unit, obj_task_actor))
	{
		// 3x3 inventory
		inv_sprite = spr_inventory_grid;
	}
	else if(unit.object_index == obj_fridge)
	{
		// 4x6 inventory
		inv_sprite = spr_fridge_inventory_grid;
	}
	if(inv_sprite != noone)
	{
		inventory_x = x_or;
		inventory_y = next_y_offset;
		inventory_w = sprite_get_width(inv_sprite);
		inventory_h = sprite_get_height(inv_sprite);
		scr_draw_unit_inventory(unit, inv_sprite, inventory_x, inventory_y);
	}
	#endregion 
	
	// todo: tooltip
	if(hover)
	{
		if(hover_inventory) scr_draw_tooltip("inventory");
		else if(hover_deselect) scr_draw_tooltip("deselect unit");
		else if(hover_center) scr_draw_tooltip("center camera");
		else scr_draw_tooltip("details panel");
	}
}