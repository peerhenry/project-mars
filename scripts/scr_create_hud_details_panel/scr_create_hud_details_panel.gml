/// @arg unit;
function scr_create_hud_details_panel(argument0) {
	var arg_unit = argument0;
	var container = instance_create_depth(global.gui, arg_unit, 0, obj_gui_details_panel);

	with(container)
	{
	#region Set container settings
	
		step_script = scr_gui_item_step_set_hover;
		should_draw_panel = true;
		padding = 8;
		// todo: set these things as a result of the contents
		width = 384;
		height = 550; // 32 + 16 + 24*5 + 64*3 + 96 + 94; // padding + spaces + lines + inventory + avatar + (extra height needed to fit fridge)
		top = display_get_gui_height() - height;
		left = 0;
		right = left + width;
		bottom = top + height;
	
	#endregion
	
	#region title, avatar, health/integrity
		// title
		var title = scr_create_gui_item_text(container, left + padding, top + padding, font_hud, arg_unit.name);
	
		// avatar
		var avatar_size = 96;
		var av_x = width - padding - avatar_size;
		var av_y = top + padding;
		var avatar = scr_create_gui_item(container, av_x, av_y, avatar_size, avatar_size);
		with(avatar)
		{
			sprite = arg_unit.sprite_index;
			sprite_crop = sprite_get_height(sprite) > 96;
			sprite_x = av_x + 48;
			sprite_y = av_y + 48;
			should_draw_rectangle = true;
			rectangle_color_top = c_dkgray;
			rectangle_color_top = c_dkgray;
			rectangle_color_bottom = c_black;
			rectangle_color_bottom = c_black;
		}
	
		// health bar
		var prop = scr_instance_inherits(arg_unit, obj_movable) ? unit_prop.entity_health : unit_prop.integrity;
		var bar_w = width - 3*padding - avatar_size;
		var bar_h = 6;
		var healthbar = scr_create_gui_item_healthbar(container, left + padding, top + padding*2 + title.height, bar_w, bar_h, arg_unit, prop);
	#endregion
	
	#region settings
		var next_y_offset = top + 2*padding + avatar_size;
		var panel_font = font_small;
		var font_h = font_get_size(panel_font);
		var line_height = font_h + 14; // 14 to fit grid show buttons
		var text_halign = fa_left;
		var text_valign = fa_top;
		var content_left = left + padding;
	#endregion
	
	#region need bars
	
		var bar_left = right - padding - bar_w;
	
		if(scr_instance_inherits(arg_unit, obj_astronaut)) // astro bars
		{	
		#region oxygen
		
			var olabel = scr_create_gui_item_text(container, content_left, next_y_offset + (line_height - font_h)/2, panel_font, "Oxygen");
		
			var obar = scr_create_gui_item_healthbar(
				container, 
				bar_left, 
				next_y_offset + (line_height - bar_h)/2, 
				bar_w, 
				bar_h, 
				arg_unit,
				unit_prop.suit_oxygen
			);
		
			next_y_offset += line_height;
		
		#endregion
		
		#region sleep
		
			scr_create_gui_item_text(container, content_left, next_y_offset + (line_height - font_h)/2, panel_font, "Sleep");
		
			scr_create_gui_item_healthbar(
				container, 
				bar_left, 
				next_y_offset + (line_height - bar_h)/2, 
				bar_w, 
				bar_h, 
				arg_unit,
				unit_prop.sleep
			);
		
			next_y_offset += line_height;
		
		#endregion
		
		#region food bar
		
			food_label = scr_create_gui_item_text(container, content_left, next_y_offset + (line_height - font_h)/2, panel_font, "Food");
			food_label.tooltip_title = "If food level reaches zero astronauts will start to lose health.";
			food_label.tooltip_description = "If food level reaches zero astronauts will start to lose health.";
			scr_create_gui_item_healthbar(
				container, 
				bar_left, 
				next_y_offset + (line_height - bar_h)/2, 
				bar_w, 
				bar_h, 
				arg_unit,
				unit_prop.food
			);
		
			next_y_offset += line_height;
		
		#endregion
		
		}
		else if(arg_unit.object_index == obj_cart || arg_unit.object_index == obj_robot) // robot bars
		{
		#region battery charge
		
			scr_create_gui_item_text(container, content_left, next_y_offset + (line_height - font_h)/2, panel_font, "Battery Charge");
			// blabel.tooltip_text = "If battery charge reach zero, this unit will stop functioning.";
			scr_create_gui_item_healthbar(
				container, 
				bar_left, 
				next_y_offset + (line_height - bar_h)/2, 
				bar_w, 
				bar_h, 
				arg_unit,
				unit_prop.battery_charge
			);
		
			next_y_offset += line_height;
		
		#endregion
		}
	#endregion
	
	#region grid props
		if(scr_instance_inherits(arg_unit, obj_constructable))
		{
			next_y_offset = scr_hdp_create_grid_props(container, next_y_offset);
		}
	#endregion
	
	#region buttons
	
		scr_hdp_create_topleft_buttons(container, right, top);
		next_y_offset = scr_hdp_create_unit_buttons(arg_unit, container, content_left, next_y_offset);
	
	#endregion
	
	#region inventory
	
		if( scr_instance_inherits(arg_unit, obj_task_actor) || arg_unit.object_index == obj_fridge )
		{
			var gui_inv = instance_create_depth(container, 0, 0, obj_gui_item);
			with(gui_inv)
			{
				sprite = arg_unit.object_index == obj_fridge ? spr_fridge_inventory_grid : spr_inventory_grid;
				width = sprite_get_width(sprite);
				height = sprite_get_height(sprite);
				left = content_left;
				top = next_y_offset + other.padding;
				right = left + width;
				bottom = top + height;
				sprite_x = left;
				sprite_y = top;
				unit = arg_unit;
				inventory = arg_unit.inventory;
				draw_script = scr_gui_item_draw_inventory;
			}
		}
	
	#endregion
	}

	return container;


}
