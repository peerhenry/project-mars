// draw gui items
for(var n = 0; n < gui_item_count; n++)
{
	var next_gui_item = gui_item_list[| n];
	with(next_gui_item) event_user(0);
}

// draw gui tooltip
if(hover_item != noone)
{
	var tooltip = hover_item.tooltip_data;
	if(instance_exists(tooltip)) scr_draw_tooltip_dto(tooltip);
}