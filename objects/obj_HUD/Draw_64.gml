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
scr_draw_shiny_line(0, hud_bar_h, gui_w, hud_bar_h, hud_border_color);
#endregion

#region TOOLTIPS

if(hover_button != noone)
{
	scr_draw_tooltip(hover_button.tooltip_text);
}

if(global.hovering_over_HUD) exit;
var tile = instance_position(mouse_x, mouse_y, obj_base_tile);
var comp = instance_position(mouse_x, mouse_y, obj_base_component);
if(tile != noone && comp == noone && !tile.under_construction)
{
	var le_room = scr_room_at(mouse_x, mouse_y);
	if(le_room != noone) scr_draw_tooltip("oxygen: " + string( floor(le_room.oxygen_level) ) + "%");
}
if(comp != noone)
{
	scr_draw_tooltip(string( comp.name ));
}

#endregion