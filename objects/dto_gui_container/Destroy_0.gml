for(var n = 0; n < ds_list_size(gui_item_list); n++)
{
	var next_gui_item = gui_item_list[| n];
	instance_destroy(next_gui_item);
}
event_inherited();
ds_list_destroy(gui_item_list);