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
		){
			if(inv_hover_item == 0) show_message("HOVER ITEM IS 0"); // DEBUG CHECK //todo: properly solve this problem
			else if(inv_hover_item.name == 0) show_message("HOVER ITEM.NAME IS 0");
			
			scr_draw_tooltip(inv_hover_item.name); //todo: will sometimes cause fatal error when hovering over inventory (unstable?)
		}
		else scr_draw_tooltip(hover_component.tooltip_text);
	}
	else scr_draw_tooltip("Details panel");
}