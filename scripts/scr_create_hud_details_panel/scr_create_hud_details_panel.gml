/// @arg unit;
var arg_unit = argument0;
var container = instance_create_layer(0,0,0,dto_gui_container);

with(container)
{
	#region Set container settings
	
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
	var title = scr_create_gui_item_text(left + padding, top + padding, font_hud, arg_unit.name);
	ds_list_add(gui_item_list, title);
	
	// avatar
	var avatar_size = 96;
	var avatar = scr_create_gui_item(width - padding - avatar_size, top + padding, avatar_size, avatar_size);
	with(avatar)
	{
		sprite = arg_unit.sprite_index;
		should_draw_rectangle = true;
		rectangle_color_top = c_dkgray;
		rectangle_color_top = c_dkgray;
		rectangle_color_bottom = c_black;
		rectangle_color_bottom = c_black;
	}
	ds_list_add(gui_item_list, avatar);
	
	var prop = unit_prop.health_integrity;
	var bar_w = width - 3*padding - avatar_size;
	var bar_h = 6;
	var healthbar = scr_create_gui_item_healthbar(left + padding, top + padding*2 + title.height, bar_w, bar_h, arg_unit, prop);
	ds_list_add(gui_item_list, healthbar);
	
	// refactor front
	
	/*
	var next_y_offset = top + 2*padding + avatar_size;
	
	var panel_font = font_small;
	var font_h = font_get_size(panel_font);
	var line_height = font_h + 14; // 14 to fit grid show buttons
	var text_halign = fa_left;
	var text_valign = fa_top;
	#endregion
	
	#region need bars
	if(scr_instance_inherits(unit, obj_astronaut))
	{
		#region oxygen
		
		var olabel = scr_create_details_component_text(unit, left + padding, next_y_offset + (line_height - font_h)/2, panel_font, "Oxygen", text_valign, text_halign);
		olabel.tooltip_text = "Shows the amount of oxygen in space suit.";
		ds_list_add(component_list, olabel);
		
		var obar = scr_create_details_component_bar(
			unit, 
			unit_prop.suit_oxygen, 
			right - padding - bar_w, 
			next_y_offset + (line_height - bar_h)/2, 
			bar_w,
			bar_h,
			global.oxygen_bar_color
		);
		obar.tooltip_text = "Suit oxygen";
		ds_list_add(component_list, obar);
		next_y_offset += line_height;
		
		#endregion
		
		#region sleep
		
		var slabel = scr_create_details_component_text(unit, left + padding, next_y_offset + (line_height - font_h)/2, panel_font, "Sleep", text_valign, text_halign);
		slabel.tooltip_text = "Shows how well rested an astronaut is. Astronaut movement speed will decrease as sleep decreases.";
		ds_list_add(component_list, slabel);
		
		var sbar = scr_create_details_component_bar(
			unit, 
			unit_prop.sleep, 
			right - padding - bar_w, 
			next_y_offset + (line_height - bar_h)/2, 
			bar_w,
			bar_h,
			global.sleep_bar_color
		);
		sbar.tooltip_text = "Sleep";
		ds_list_add(component_list, sbar);
		next_y_offset += line_height;
		
		#endregion
		
		#region food bar
		
		var flabel = scr_create_details_component_text(unit, left + padding, next_y_offset + (line_height - font_h)/2, panel_font, "Food", text_valign, text_halign);
		flabel.tooltip_text = "Shows how well fed an astronaut is. Astronauts will lose health if this reaches zero.";
		ds_list_add(component_list, flabel);
		
		var fbar = scr_create_details_component_bar(
			unit, 
			unit_prop.sleep, 
			right - padding - bar_w, 
			next_y_offset + (line_height - bar_h)/2, 
			bar_w,
			bar_h,
			global.food_bar_color
		);
		fbar.tooltip_text = "Food";
		ds_list_add(component_list, fbar);
		next_y_offset += line_height;
		
		#endregion
	}
	else if(unit.object_index == obj_cart || unit.object_index == obj_robot)
	{
		#region battery charge
		var blabel = scr_create_details_component_text(unit, left + padding, next_y_offset, panel_font, "Battery charge", text_valign, text_halign);
		blabel.tooltip_text = "If battery charge reach zero, this unit will stop functioning.";
		ds_list_add(component_list, blabel);
		var bbar = scr_create_details_component_bar(
			unit, 
			unit_prop.battery_charge, 
			right - padding - bar_w, 
			next_y_offset, 
			bar_w,
			4,
			c_aqua
		);
		bbar.tooltip_text = "Battery charge";
		ds_list_add(component_list, bbar);
		next_y_offset += line_height;
		#endregion
	}
	#endregion
	
	#region grid props
	if(scr_instance_inherits(unit, obj_constructable)) // grid props
	{
		var tab = floor((right - left - 2*padding)/3);
		// grid - role - value
		for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
		{
			//var grid_props = scr_get_grid_props(arg_instance, grid_type);
			if(scr_has_grid_props(unit, grid_type))
			{
				var grid_string = scr_grid_type_to_string(grid_type);
				var gridlabel = scr_create_details_component_text(unit, left + padding, next_y_offset, panel_font, grid_string, text_valign, text_halign);
				gridlabel.tooltip_text = "Grid type this component is connected to";
				ds_list_add(component_list, gridlabel);
				
				var role_s = "";
				var role = scr_get_grid_prop(unit, grid_type, macro_grid_prop_role);
				switch(role)
				{
					case macro_grid_role_carrier: role_s = "carrier"; break;
					case macro_grid_role_source: role_s = "source"; break;
					case macro_grid_role_consumer: role_s = "consumer"; break;
					case macro_grid_role_storage: role_s = "storage"; break;
				}
				var role_label = scr_create_details_component_text(unit, left + padding + tab, next_y_offset, panel_font, role_s, text_valign, text_halign);
				role_label.tooltip_text = "Role in grid";
				ds_list_add(component_list, role_label);
				
				var val = scr_get_grid_prop(unit, grid_type, macro_grid_prop_value);
				var val_label = scr_create_details_component_text(unit, left + padding + 2*tab, next_y_offset, panel_font, string(val), text_valign, text_halign);
				val_label.tooltip_text = "Value of the role in the grid";
				ds_list_add(component_list, val_label);
				
				// grid button
				var grid = scr_get_grid(unit, grid_type);
				var grid_btn = scr_create_grid_details_button(
					unit, 
					right - padding - 24, 
					next_y_offset, 
					24, 
					24, 
					spr_eye_16, // todo: make dedicated icon for this
					grid
				);
				grid_btn.tooltip_text = "Show grid details";
				ds_list_add(component_list, grid_btn);
				
				next_y_offset += line_height;
			}
		}
	}
	#endregion
	
	#region buttons
	
	var button_h = 24;
	var button_w = 24;
	
	// top buttons
	var dbtn = scr_create_panel_icon_button(unit, right - button_w + 1, top - button_h, button_w, button_h, spr_deselect_icon, details_panel_action.deselect);
	dbtn.tooltip_text = "Deselect unit";
	ds_list_add(component_list, dbtn);
	var cbtn = scr_create_panel_icon_button(unit, right - button_w*2 + 1, top - button_h, button_w, button_h, spr_center_cam_icon, details_panel_action.center);
	cbtn.tooltip_text = "Center camera on unit";
	ds_list_add(component_list, cbtn);
	
	// button section
	if(unit.object_index == obj_cart)
	{
		var deploybtn = scr_create_panel_icon_button(
			unit, 
			left + padding, 
			next_y_offset, 
			32, 
			32, 
			spr_deploy, 
			details_panel_action.deploy
		);
		deploybtn.tooltip_text = "Toggle deploy mode";
		ds_list_add(component_list, deploybtn);
		next_y_offset += deploybtn.height + padding;
	}
	
	#endregion
	
	#region inventory
	
	if( scr_instance_inherits(unit, obj_task_actor) || unit.object_index == obj_fridge )
	{
		var inv_comp = scr_create_details_component_inventory(unit, left + padding, next_y_offset + padding);
		inv_comp.tooltip_text = "inventory";
		ds_list_add(component_list, inv_comp);
	}
	
	#endregion
	
	*/
}

return container;