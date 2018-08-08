#region BAR AND BUTTONS

draw_set_alpha(0.9);
draw_rectangle_color(0, 0, gui_w, hud_bar_h, c_teal, c_teal, c_black, c_black, false);
draw_set_alpha(1.0);

for(var n = 0; n< ds_list_size(buttons); n++)
{
	var button = buttons[| n];
	var hovers = hover_button == button;
	if(button.draw_as_panel) scr_draw_hud_button(button, hovers, press_button);
	else scr_draw_hud_bar_button(button, hovers, press_button);
}

#endregion

#region BAR BOTTOM LINE
scr_draw_shiny_line(0, hud_bar_h, gui_w, hud_bar_h, hud_border_color);
#endregion