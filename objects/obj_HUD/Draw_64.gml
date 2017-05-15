// box
draw_set_color(global.btn_bg_color);
draw_rectangle(btn_left, btn_top, btn_right, btn_bottom, false);
// outline
draw_set_color(c_black);
draw_rectangle(btn_left, btn_top, btn_right, btn_bottom, true);
// text
draw_set_halign(fa_middle); draw_set_valign(fa_middle);
draw_set_font(font_hud);
draw_set_color(global.btn_color);
draw_text(btn_center_x, btn_center_y, "Menu");

// draw background
draw_set_color(c_black);
// draw_rectangle(x_offset, y_offset, x_offset + 31, y_offset + (32 + y_spacing)*build_count - y_spacing, false);
draw_rectangle(
	0, 
	y_offset - 12, 
	x_offset + 31 + 12, 
	y_offset + (32 + y_spacing)*build_count - y_spacing + 12, 
	false);

// draw build buttons
buffer_seek(build_button_buffer, buffer_seek_start, 0);
for(var n = 0; n < build_count; n++)
{
	var next_sprite = buffer_read(build_button_buffer, buffer_s32);
	var next_u32 = buffer_read(build_button_buffer, buffer_u32);
	var next_image_index = next_u32 & 255;
	var b_state = (next_u32 >> 8) & 255; // second byte is state
	
	// draw sprite
	draw_sprite(next_sprite, next_image_index, x_offset + 16, y_offset + 16 + (32 + y_spacing)*n);
	
	// draw overlay
	var left = x_offset;
	var top = y_offset + (32 + y_spacing)*n;
	var right = x_offset + 31;
	var bottom = y_offset + (32 + y_spacing)*n + 31;
	if(b_state == button_state.hover)
	{
		draw_set_alpha(0.3);
		draw_set_color(c_white);
		draw_rectangle(left, top, right, bottom, false);
		draw_set_alpha(1);
	}
	else if(b_state == button_state.selected)
	{
		draw_set_alpha(0.3);
		draw_set_color(c_aqua);
		draw_rectangle(left, top, right, bottom, false);
		draw_set_alpha(1);
	}
	
	// outline
	draw_set_color(c_black);
	draw_rectangle(left, top, right, bottom, true);
}