var arg_component = argument0;

with(arg_component)
{	
	switch(class)
	{
		case details_panel_component_class.label:	// text in a square
			draw_rectangle_color(left, top, right, bottom, rectangle_color_top, rectangle_color_top, rectangle_color_bottom, rectangle_color_bottom, false);
		case details_panel_component_class.text:	// pure text
			draw_set_font(font);
			draw_set_halign(halign);
			draw_set_valign(valign);
			draw_set_color(text_color);
			draw_text(text_x, text_y, text);
			break;
		case details_panel_component_class.bar:		// need bar or health bar
			var col = bar_color;
			if(unit_property == unit_prop.health_integrity)
			{
				if(prop_value < 50)
				{
					if(prop_value < 20) col = c_red;
					else col = c_yellow;
				}
				else col = c_lime;
			}
			if(unit_property == unit_prop.suit_oxygen)
			{
				if(!unit.wears_suit) exit;
			}
			draw_healthbar(left, top, right, bottom, prop_value, c_black, col, col, 0, true, true);
			break;
		case details_panel_component_class.avatar:	// sprite in square
			draw_rectangle_color(left, top, right, bottom, rectangle_color_top, rectangle_color_top, rectangle_color_bottom, rectangle_color_bottom, false);
			var avatar = scr_get_avatar(unit);
			draw_set_alpha(1);
			if( scr_instance_inherits(unit, obj_astronaut) ) draw_sprite(avatar, 0, left, top);
			else draw_sprite_ext(avatar, 0, left + width/2, top + height/2, 1, 1, 0, c_white, 1.0);
			break;
		case details_panel_component_class.sprite_button:
			scr_draw_details_panel_button_background(id);
		case details_panel_component_class.sprite:	// pure sprite
			draw_sprite(sprite, subimg, sprite_x, sprite_y);
			break;
		case details_panel_component_class.text_button:
			scr_draw_details_panel_button_background(id);
			draw_set_font(font);
			draw_set_halign(halign);
			draw_set_valign(valign);
			draw_text(text_x, text_y, text);
			break;
		case details_panel_component_class.inventory:
			scr_draw_unit_inventory(unit, sprite, left, top);
			break;
	}
}