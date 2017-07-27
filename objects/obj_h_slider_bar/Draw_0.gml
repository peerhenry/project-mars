draw_self();

// Draw percentage to the right of slidebar
draw_set_halign(fa_left);
draw_text(x + sprite_width/2 + macro_slider_label_offset, y, string(slider.percentage));

draw_set_valign(fa_middle);
// draw text to the left of slide bar
draw_set_halign(fa_right);
draw_text(x - sprite_width/2 - macro_slider_label_offset, y, string(text));