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
draw_set_font(font_small);
draw_set_color(c_white);
draw_text(resources_center_x - 100, resources_center_y, "Metal: " + string(scr_get_metal_amount()));
draw_text(resources_center_x + 100, resources_center_y, "Gold: " + string(0));
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
