/// @arg button
with(argument0)
{
	if(button_hover)
	{
		sprite_color = sprite_hover_color;
		rectangle_color_top = rectangle_hover_color_top;
		rectangle_color_bottom = rectangle_hover_color_bottom;
	}
	else if(button_down)
	{
		sprite_color = sprite_down_color;
		rectangle_color_top = rectangle_down_color_top;
		rectangle_color_bottom = rectangle_down_color_bottom;
	}
	else
	{
		sprite_color = sprite_button_color;
		rectangle_color_top = rectangle_button_color_top;
		rectangle_color_bottom = rectangle_button_color_bottom;
	}
	
	if(get_state != noone) scr_gui_item_step_state_button_color(id);
}