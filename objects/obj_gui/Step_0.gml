for(var n = 0; n < ds_list_size(gui_item_list); n++)
{
	var next_gui_item = gui_item_list[| n];
	with(next_gui_item) if(visible) event_user(macro_gui_event_update);
}