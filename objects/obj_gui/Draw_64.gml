/// @descr draw gui items and tooltip
// draw gui items
for(var n = 0; n < ds_list_size(gui_item_list); n++)
{
	var next_gui_item = gui_item_list[| n];
	with(next_gui_item) if(visible) event_user(macro_gui_event_draw);
}

// draw gui tooltip here
var hover_item = global.gui_hover_item;
if(
	hover_item != noone 
	&& instance_exists(hover_item) 
	&& hover_item.hover
){
	with(hover_item)
	{
		if(string_length(tooltip_title) > 0)
		{
			scr_draw_tooltip_description(tooltip_title, tooltip_description);
		}
	}
}