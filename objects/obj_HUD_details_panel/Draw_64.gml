scr_draw_panel(left, top, right, bottom);

for(var n = 0; n < ds_list_size(component_list); n++)
{
	var next_component = component_list[| n];
	scr_draw_details_panel_component(next_component);
}

if(hover)
{
	if(hover_component != noone)
	{
		if(
			hover_component.class == details_panel_component_class.inventory 
			&& inv_hover_item != noone
		) scr_draw_tooltip(inv_hover_item.name);
		else scr_draw_tooltip(hover_component.tooltip_text);
	}
	else scr_draw_tooltip("Details panel");
}