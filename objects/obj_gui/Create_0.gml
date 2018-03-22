gui_item_list = ds_list_create();
global.gui = id;
global.hud_details_panel = noone; // todo: move to init_globals
global.gui_hover_item = noone;

instance_create_depth(id, 0, 0, dto_hud_construction_menu);