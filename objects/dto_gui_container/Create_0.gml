event_inherited();
gui_item_list = ds_list_create();
gui_item_count = ds_list_size(gui_item_list);
reset = false;

step_script = noone;
class = gui_item_class.container;
callback_item = noone;

#macro macro_gui_container_click_callback 10
#macro macro_gui_container_mouse_enter_callback 11
#macro macro_gui_container_mouse_leave_callback 12