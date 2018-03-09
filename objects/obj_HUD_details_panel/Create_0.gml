component_list = ds_list_create();
// build component list based on unit;

hover = false;
width = 384;
height = 550; // 32 + 16 + 24*5 + 64*3 + 96 + 94; // padding + spaces + lines + inventory + avatar + (extra height needed to fit fridge)
top = display_get_gui_height() - height;
left = 0;
right = left + width;
bottom = top + height;
padding = 16;
unit = x;
x = 0;
inv_hover_item = noone;

scr_build_details_component_list(id);