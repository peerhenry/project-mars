/// @description Click callback: any button that has this as its container will call this event on click

if(callback_item != noone)
{
	// lock panel
	if(locked_build_panel == callback_item.build_select_panel) locked_build_panel = noone;
	else
	{
		locked_build_panel = callback_item.build_select_panel;
	}
}