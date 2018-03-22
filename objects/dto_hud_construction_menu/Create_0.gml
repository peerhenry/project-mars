event_inherited();

active_category = noone;

padding = 8;
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var gui_half_w = gui_w/2;
var b_size = 32;
var b_left = gui_half_w - 1.5*b_size;
var b_top = gui_h - b_size - padding;

width = b_size*4 + 2*padding;
height = b_size + 2*padding;
left = b_left - padding;
top = b_top - padding;
right = left + width;
bottom = top + height;
should_draw_panel = true;

scr_create_construction_category_button(id, b_left, b_top, spr_destruct, macro_category_deconstruction, "Deconstruction");
scr_create_construction_category_button(id, b_left + 32, b_top, spr_category_foundation, macro_category_foundation, "Foundation");
scr_create_construction_category_button(id, b_left + 64, b_top, spr_category_inside, macro_category_inside, "Inside Constructions");
scr_create_construction_category_button(id, b_left + 96, b_top, spr_category_outside, macro_category_outside, "Outside Constructions");