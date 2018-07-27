if(container != noone && instance_exists(container) && !container.being_destroyed)
{
	var list = container.gui_item_list;
	var index = ds_list_find_index(list, id);
	ds_list_delete(list, index);
}