/// @arg unit;
var arg_unit = argument0;
var container = instance_create_depth(global.gui, arg_unit, 0, dto_hud_details_panel);

show_debug_message("creating refactored hud details panel..."); // DEBUG

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
	
	// settings
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
		
		scr_create_gui_item_text(container, content_left, next_y_offset + (line_height - font_h)/2, panel_font, "Food");
		// flabel.tooltip_text = "Shows how well fed an astronaut is. Astronauts will lose health if this reaches zero.";
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
		var tab = floor((right - left - 2*padding)/3);
		// grid - role - value
		for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
		{
			if(scr_has_grid_props(arg_unit, grid_type))
			{
				var grid_string = scr_grid_type_to_string(grid_type);
				
				var gridlabel = scr_create_gui_item_text(container, content_left, next_y_offset, panel_font, grid_string);
				gridlabel.tooltip_title = "Grid type";
				gridlabel.tooltip_description = "There are 4 different grid types: electric, water, oxygen and hydrogen.";
				
				var role_s = "";
				var role = scr_get_grid_prop(unit, grid_type, macro_grid_prop_role);
				switch(role)
				{
					case macro_grid_role_carrier: role_s = "carrier"; break;
					case macro_grid_role_source: role_s = "source"; break;
					case macro_grid_role_consumer: role_s = "consumer"; break;
					case macro_grid_role_storage: role_s = "storage"; break;
				}
				var role_label = scr_create_gui_item_text(container, content_left + tab, next_y_offset, panel_font, role_s);
				// role_label.tooltip_text = "Role in grid";
				role_label.tooltip_title = "Role in grid";
				role_label.tooltip_description = "All components connected to a grid play one of four roles: Carrier - connects adjacent components to grid, Source - generates resource of grid type, Consumer - depletes the resource, or Storage - stores excess generated by sources up to capacity.";
				
				var val = scr_get_grid_prop(unit, grid_type, macro_grid_prop_value);
				var val_label = scr_create_gui_item_text(container, content_left + 2*tab, next_y_offset, panel_font, string(val));
				val_label.tooltip_title = "Value";
				val_label.tooltip_description = "The meaning of the value depends on the role: Source - the amount generated per second, Consumer - the amount consumed per second, Storage - the amount that the component can store.";
				
				// grid button
				var grid = scr_get_grid(unit, grid_type);
				var grid_btn = scr_create_gui_item_icon_button(container, right - padding - 24, next_y_offset, spr_eye_16, 4, details_panel_action.show_grid_details);
				grid_btn.grid = grid;
				grid_btn.tooltip_title = "Show grid details";
				
				next_y_offset += line_height;
			}
		}
	}
	#endregion
	
	#region buttons
	
	var button_w = 24;
	var button_h = 24;
	// Deselect button
	var ds_btn = scr_create_gui_item_icon_button(container, right - button_w, top - button_h - 1, spr_deselect_icon, 4, details_panel_action.deselect);
	ds_btn.tooltip_text = "Deselect unit";
	// Center cam button
	var center_button = scr_create_gui_item_icon_button(container, right - button_w*2 - 1, top - button_h - 1, spr_center_cam_icon, 4, details_panel_action.center);
	center_button.tooltip_text = "Center camera on unit";
	
	// Deploy button
	if(arg_unit.object_index == obj_cart)
	{
		var deploybtn = scr_create_gui_item_icon_button(container, content_left, next_y_offset, spr_deploy, 0, details_panel_action.deploy);
		deploybtn.tooltip_title = "Toggle deploy mode";
		deploybtn.tooltip_description = "If cart is carrying a component, you can use this button to order the cart to place the component on any location on the map."; 
		next_y_offset += deploybtn.height + padding;
	}
	
	#endregion
	
	#region inventory
	
	if( scr_instance_inherits(arg_unit, obj_task_actor) || arg_unit.object_index == obj_fridge )
	{
		var gui_inv = instance_create_depth(container, 0, 0, dto_gui_item);
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