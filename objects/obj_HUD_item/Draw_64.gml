/*
var next_sprite = buffer_read(build_button_buffer, buffer_s32);
var next_u32 = buffer_read(build_button_buffer, buffer_u32);
var next_build = buffer_read(build_button_buffer, buffer_s32);
var next_image_index = next_u32 & 255;
var b_state = (next_u32 >> 8) & 255; // second byte is state
*/
	
var left = x;
var top = y;
var right = x + 32;
var bottom = y + 32;

// draw sprite
if(sprite_index != noone) draw_sprite(sprite_index, image_index, x + 16, y + 16);
else show_debug_message("sprite_index was noone : (");
draw_set_alpha(0.3);
draw_set_color(c_aqua);
draw_rectangle(left, top, right, bottom, false);
draw_set_alpha(1);
	
// draw overlay
if(state == button_state.hover || state == button_state.selected)
{
	draw_set_alpha(0.3);
	draw_set_color(c_white);
	draw_rectangle(left, top, right, bottom, false);
	draw_set_alpha(1);
}
	
// tooltip
if(state == button_state.hover)
{
	var tt_left = right;
	var tt_right = right + 320;
	var tt_center_x = (tt_left + tt_right)/2;
	var tt_center_y = (top + bottom)/2;
		
	draw_set_color(global.btn_bg_color);
	draw_rectangle(right, top, tt_right, bottom, false);
		
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_set_font(font_hud);
	var tt_text = scr_get_tooltip_text(construction);
	draw_set_color(global.btn_color);
	draw_text(tt_center_x, tt_center_y, tt_text);
}
	
// outline
draw_set_color(c_black);
draw_rectangle(left, top, right, bottom, true);