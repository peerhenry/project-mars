/// @arg window_x
/// @arg window_y
/// @arg title
/// @arg description
function scr_draw_gui_tooltip_at(argument0, argument1, argument2, argument3) {
	var arg_x = argument0;
	var arg_y = argument1;
	var arg_title = argument2;
	var arg_description = argument3;

	// ####################
	// # calculate geometric properties
	// ####################

	// todo: to save these calculations from happening every draw cycle, move them to the create event of a dto_tooltip that is passed in here as an argument

	var pad = 4;
	var pad2 = pad*2;
	var has_description = string_length(arg_description) > 0;

	var font = font_small;
	draw_set_font(font);
	var max_width = 192;
	var line_jump = font_get_size(font) + 4;

	// title
	var title_w = string_width_ext(arg_title, line_jump, max_width);
	var title_h = string_height_ext(arg_title, line_jump, max_width);
	var title_box_h = title_h + pad;

	// description
	var descr_w = string_width_ext(arg_description, line_jump, max_width);
	var descr_h = string_height_ext(arg_description, line_jump, max_width);
	var descr_box_h = descr_h + pad;

	// tooltip
	var content_w = max(title_w, descr_w);
	var tt_w = content_w + pad2;
	var tt_h = title_box_h;
	if(has_description) tt_h += descr_box_h;
	var tt_top = arg_y;
	var tt_left = arg_x;
	var tt_right = tt_left + tt_w;

	// ####################
	// # confine tt to display
	// ####################

	var confine_w = window_get_width(); // display_get_gui_width();
	var confine_h = window_get_height(); // display_get_gui_height();
	if(tt_left + tt_w >= confine_w) tt_left = confine_w - tt_w - 1; // extra -1 to prevent losing the outline
	if(tt_top + tt_h >= confine_h) tt_top  = confine_h - tt_h - 1;

	// ####################
	// # draw title
	// ####################

	var title_box_bottom = tt_top + title_box_h;

	// box
	draw_set_color(c_teal);
	draw_set_alpha(0.9);
	draw_rectangle(tt_left, tt_top + 2, tt_right - 1, title_box_bottom, false);
	// outline
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_rectangle(
		tt_left - 1,
		tt_top + 1,
		tt_right,
		title_box_bottom + 1,
		true);
	// text
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(tt_left + pad, tt_top + pad, arg_title, line_jump, max_width);

	// ####################
	// # draw description
	// ####################

	if(has_description)
	{
		var descr_box_top = tt_top + title_box_h;
		var descr_box_bottom = descr_box_top + descr_box_h;
	
		// box
		draw_set_color(c_dkgray);
		draw_set_alpha(0.9);
		draw_rectangle(tt_left, descr_box_top + 2, tt_right - 1, descr_box_bottom, false);
		// outline
		draw_set_alpha(1.0);
		draw_set_color(c_white);
		draw_rectangle(tt_left - 1, descr_box_top + 1, tt_right, descr_box_bottom + 1, true);
		// text
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text_ext(tt_left + pad, descr_box_top + pad, arg_description, line_jump, max_width);
	}


}
