/// @description Draw tooltip

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