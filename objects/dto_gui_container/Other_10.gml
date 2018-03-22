/// @description Update gui items
hover = false;
event_inherited();

// draw gui items
for(var n = 0; n < ds_list_size(gui_item_list); n++)
{
	var next_gui_item = gui_item_list[| n];
	if(next_gui_item.hover) hover = true;
	with(next_gui_item) if(visible) event_user(macro_gui_event_update);
}