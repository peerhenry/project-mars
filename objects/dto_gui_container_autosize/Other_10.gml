/// @description Step
event_inherited();

var new_count = ds_list_size(gui_item_list);
if(new_count != gui_item_count)
{
	gui_item_count = new_count;
	event_user(macro_gui_event_update_geomtery);
}