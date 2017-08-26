var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var spr_left = (gui_w - sprite_width)/2;
var spr_top = (gui_h - sprite_height)/2;
var spr_right = (gui_w + sprite_width)/2;
var spr_bottom = (gui_h + sprite_height)/2;

var margin = 16;
var rec_left = spr_left - margin;
var rec_top = spr_top - margin;
var rec_right = spr_right + margin;
var rec_bottom = spr_bottom + margin;

draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(rec_left, rec_top, rec_right, rec_bottom, false);
draw_set_alpha(1);
draw_sprite(sprite_index, 0, gui_w/2, gui_h/2);