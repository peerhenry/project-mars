gui_item_list = ds_list_create();
gui_item_count = ds_list_size(gui_item_list);
reset = false;

class = gui_item_class.container;
click_item = noone;

#macro macro_gui_container_click_callback 10