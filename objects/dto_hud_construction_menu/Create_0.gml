event_inherited();

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
origin_x = gui_w/2;
origin_y = gui_h;
halign = align_h.center;
valign = align_v.bottom;
spacing = 2;
padding = 8;
should_draw_panel = true;
orientation = stack.horizontal;
height = 32 + 2*padding; // required by build_select_panel in scr_create_construction_category_button
active_build_panel = noone;

scr_create_construction_category_button(id, spr_destruct, macro_category_deconstruction, "Deconstruction");
scr_create_construction_category_button(id, spr_category_foundation, macro_category_foundation, "Foundation");
scr_create_construction_category_button(id, spr_category_inside, macro_category_inside, "Inside Constructions");
scr_create_construction_category_button(id, spr_category_outside, macro_category_outside, "Outside Constructions");