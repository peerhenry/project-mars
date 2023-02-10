/// @arg arg_button
/// @arg hovers
/// @arg press_button
function scr_draw_hud_button(argument0, argument1, argument2) {
	var arg_button = argument0;
	var arg_hovers = argument1;
	var arg_press_button = argument2;

	var left = arg_button.x;
	var top = arg_button.y;
	var right = arg_button.x + arg_button.width;
	var bottom = arg_button.y + arg_button.height;
	var sprite = arg_button.sprite;
	var subimg = arg_button.subimg;

	if(arg_hovers)
	{
		if(mouse_check_button_pressed(mb_left) && arg_press_button == arg_button)
		{
			scr_draw_panel_inverse(left, top, right, bottom);
		}
		else if(arg_press_button == noone)
		{
			scr_draw_panel_light(left, top, right, bottom);
		}
		else scr_draw_panel(left, top, right, bottom);
	}
	else
	{
		scr_draw_panel(left, top, right, bottom);
	}

	if(sprite != noone)
	{
		var colour = c_black;
		if(arg_button.active) colour = c_aqua;
		draw_sprite_ext(sprite, subimg, arg_button.x + arg_button.padding_x, arg_button.y + arg_button.padding_y, 1, 1, 0, colour, 1);
	}
	else
	{
		draw_set_font(arg_button.font);
		draw_set_halign(arg_button.halign);
		draw_set_valign(arg_button.valign);
		draw_set_color(arg_button.text_color);
		draw_text(arg_button.x + arg_button.padding_x, arg_button.y + arg_button.padding_y, arg_button.text );
	}



}
