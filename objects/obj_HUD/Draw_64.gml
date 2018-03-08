#region BAR AND BUTTONS

draw_set_alpha(0.9);
draw_rectangle_color(0, 0, gui_w, hud_bar_h, c_teal, c_teal, c_black, c_black, false);
draw_set_alpha(1.0);

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var hover_button = noone;
for(var n = 0; n< ds_list_size(buttons); n++)
{
	var button = buttons[| n];
	var hovers = 
		window_mouse_x > button.left
		&& window_mouse_x < button.right
		&& window_mouse_y > button.top
		&& window_mouse_y < button.bottom;
	if(hovers) hover_button = button;
	if(button.draw_as_panel) scr_draw_hud_button(button, hovers);
	else scr_draw_hud_bar_button(button, hovers);
}

#endregion

#region RESOURCE COUNTER
// text
draw_set_halign(fa_center); 
draw_set_valign(fa_middle);
draw_set_font(font_hud);
draw_set_color(c_white);
draw_text(resources_center_x - 100, resources_center_y, "Metal: " + string(scr_get_metal_amount()));
draw_text(resources_center_x + 100, resources_center_y, "Gold: " + string(0));
#endregion

#region BUILD PANEL

// draw background
/*draw_set_color(c_black);
// draw_rectangle(x_offset, y_offset, x_offset + 31, y_offset + (32 + y_spacing)*build_count - y_spacing, false);
draw_rectangle(
	0, 
	y_offset - padding, 
	x_offset + 31 + padding, 
	y_offset + (32 + y_spacing)*item_count - y_spacing + padding, 
	false);

draw_set_color(c_teal);
draw_set_alpha(0.3);
draw_rectangle(
	2, 
	y_offset - 10, 
	x_offset + 31 + 10, 
	y_offset + (32 + y_spacing)*item_count - y_spacing + 10, 
	false);
draw_set_alpha(1);
*/

#endregion

#region BAR BOTTOM LINE
draw_set_alpha(0.2);
draw_line_width_color(0, hud_bar_h, gui_w, hud_bar_h, 3, c_aqua, c_aqua);
draw_set_alpha(0.5);
draw_line_width_color(0, hud_bar_h, gui_w, hud_bar_h, 1, c_aqua, c_aqua);
draw_set_alpha(1.0);
#endregion

#region TOOLTIPS
var tile = instance_position(mouse_x, mouse_y, obj_base_tile);
var comp = instance_position(mouse_x, mouse_y, obj_base_component);
if(tile != noone && comp == noone)
{
	var le_room = scr_room_at(mouse_x, mouse_y);
	scr_draw_tooltip("oxygen: " + string( floor(le_room.oxygen_level) ) + "%");
}
if(comp != noone)
{
	scr_draw_tooltip(string( comp.name ));
}
if(hover_button != noone)
{
	switch(hover_button.action)
	{
		case hud_action.toggle_menu:
			scr_draw_tooltip("menu");
			break;
		case hud_action.toggle_outliner:
			scr_draw_tooltip("toggle outliner");
			break;
		case hud_action.toggle_minimap:
			scr_draw_tooltip("toggle minimap");
			break;
		case hud_action.toggle_objectives:
			scr_draw_tooltip("objectives");
			break;
		case hud_action.mission_control:
			scr_draw_tooltip("mission control");
			break;
	}
}

#endregion

#region DETAILS PANEL

var select = scr_get_single_selected();

if(select != noone) // draw details panel
{	
	// panel
	var details_panel_width = 384;
	var details_panel_height = 32 + 16 + 24*5 + 64*3 + 96; // padding + spaces + lines + inventory + avatar
	var top = display_get_gui_height() - details_panel_height;
	var left = 0;
	var right = left + details_panel_width;
	var bottom = top + details_panel_height;
	var padding = 16;
	scr_draw_panel(left, top, right, bottom);
	
	// avatar
	draw_set_color(c_black);
	var av_w = 96;
	var av_h = 96;
	var av_x = left + details_panel_width - padding - av_w;
	var av_y = top + padding;
	draw_rectangle(av_x, av_y, av_x + av_w, av_y + av_h, false);
	var avatar = scr_get_avatar(select);
	if( scr_instance_inherits(select, obj_astronaut) ) draw_sprite(avatar, 0, av_x, av_y);
	else draw_sprite_ext(avatar, 0, av_x + av_w/2, av_y + av_h/2, 1, 1, 0, c_white, 1.0);
	
	// name
	draw_set_font(font_hud);
	var name_size = font_get_size(font_hud);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var x_or = left + padding;
	draw_text(x_or, top + padding, select.name);
	
	// health / integrity
	var hb_left = left + padding;
	var hb_top = top + 2 * padding + name_size;
	var hb_right = right - 2*padding - 96;
	var hb_bottom = hb_top + 4;
	
	var h = 0;
	if(scr_instance_inherits(select, obj_movable)) h = select.entity_health;
	else h = 100 - select.damage;
	
	var hc = c_lime;
	if(h < 20) hc = c_red;
	else if(h < 50) hc = c_yellow;
	
	draw_healthbar(hb_left, hb_top, hb_right, hb_bottom, h, c_black, hc, hc, 0, true, true);
	
	var next_y_offset = top + 2*padding + 96;
	
	// needs / grid props
	var prop_font = font_small_bold;
	draw_set_font(prop_font);
	var font_height = font_get_size(prop_font)
	var line_height = font_height + 12;
	
	if(scr_instance_inherits(select, obj_movable))
	{
		var bar_height = 4;
		
		var bar_left = hb_left + 100;
		var bar_top = next_y_offset + (font_height - bar_height)/2;
		var bar_right = right - padding;
		var bar_bottom = bar_top + bar_height;
		
		if(scr_instance_inherits(select, obj_astronaut)) // draw need bars
		{
			// oxygen
			if(select.wears_suit)
			{
				draw_text(x_or, next_y_offset, "Oxygen " + string(floor(select.suit_oxygen)) + "%");
				draw_healthbar(bar_left, bar_top, bar_right, bar_bottom, select.suit_oxygen, c_black, oxygen_bar_color, oxygen_bar_color, 0, true, true);
				next_y_offset += line_height;
			}
			
			// sleep
			bar_top = next_y_offset + (font_height - bar_height)/2;
			draw_text(x_or, next_y_offset, "Sleep ");
			draw_healthbar(bar_left, bar_top, bar_right, bar_top + bar_height, select.sleep_level, c_black, sleep_bar_color, sleep_bar_color, 0, true, true);
			next_y_offset += line_height;
			
			// food
			bar_top = next_y_offset + (font_height - bar_height)/2;
			draw_text(x_or, next_y_offset, "Food ");
			draw_healthbar(bar_left, bar_top, bar_right, bar_top + bar_height, select.food_level, c_black, food_bar_color, food_bar_color, 0, true, true);
			next_y_offset += line_height;
		}
		else
		{
			// battery charge
			bar_top = next_y_offset + (font_height - bar_height)/2;
			draw_text(x_or, next_y_offset, "Battery " + string(floor(select.battery_charge)) + "%");
			draw_healthbar(bar_left, bar_top, bar_right, bar_top + bar_height, select.battery_charge, c_black, c_aqua, c_aqua, 0, true, true);
			next_y_offset += line_height;
		}
	}
	else if(scr_instance_inherits(select, obj_constructable)) // grid props
	{
		var tab = 100;
		// grid - role - value
		for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
		{
			//var grid_props = scr_get_grid_props(arg_instance, grid_type);
			if(scr_has_grid_props(select, grid_type))
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
				var role = scr_get_grid_prop(select, grid_type, macro_grid_prop_role);
				switch(role)
				{
					case macro_grid_role_carrier: role_s = "carrier"; break;
					case macro_grid_role_source: role_s = "source"; break;
					case macro_grid_role_consumer: role_s = "consumer"; break;
					case macro_grid_role_storage: role_s = "storage"; break;
				}
				draw_text(x_or + tab, next_y_offset, "role: " + role_s);
				
				var val = scr_get_grid_prop(select, grid_type, macro_grid_prop_value);
				draw_text(x_or + 2*tab, next_y_offset, "value: " + string(val));
				next_y_offset += line_height;
			}
		}
	}
}

#endregion