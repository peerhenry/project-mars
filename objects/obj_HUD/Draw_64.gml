#region MENU BUTTON
// box
var color = global.btn_bg_color;
if(mouse_over_menu) color = global.btn_bg_color_hover;
draw_set_color(color);
draw_rectangle(menu_btn_left, menu_btn_top, menu_btn_right, menu_btn_bottom, false);
// outline
draw_set_color(c_black);
draw_rectangle(menu_btn_left, menu_btn_top, menu_btn_right, menu_btn_bottom, true);
// text
draw_set_halign(fa_center); 
draw_set_valign(fa_middle);
draw_set_font(font_hud);
draw_set_color(global.btn_color);
draw_text(menu_btn_center_x, menu_btn_center_y, "Menu");
#endregion

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
for(var n = 0; n< ds_list_size(buttons); n++)
{
	var button = buttons[| n];
	var hovers = 
		window_mouse_x > button[? "left"] 
		&& window_mouse_x < button[? "right"]
		&& window_mouse_y > button[? "top"] 
		&& window_mouse_y < button[? "bottom"];
	scr_draw_hud_button(button, hovers);
}

#region RESOURCE COUNTER
// box
draw_set_color(global.btn_bg_color);
draw_rectangle(resources_left, resources_top, resources_right, resources_bottom, false);
// outline
draw_set_color(c_black);
draw_rectangle(resources_left, resources_top, resources_right, resources_bottom, true);
// text
draw_set_halign(fa_center); 
draw_set_valign(fa_middle);
draw_set_font(font_hud);
draw_set_color(global.btn_color);
draw_text(resources_center_x, resources_center_y, "Metal: " + string(scr_get_metal_amount()));
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

#endregion