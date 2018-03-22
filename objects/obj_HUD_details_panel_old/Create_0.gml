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

// specific for hud details panel:
unit = x; // inject unit in x
x = 0;
inv_hover_item = noone;
destroy = false; // flag is used to destroy this during update
sub_panel = noone; // used for example for grid details panel

scr_build_details_component_list(id);