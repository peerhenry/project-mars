// # Check if container should update

var new_count = ds_list_size(gui_item_list);
// use reset flag for example when removing and adding an item
if(gui_item_count != new_count || reset)
{
	event_user(0);
	gui_item_count = new_count;
}