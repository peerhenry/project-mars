/// @description Mouse enter callback

if(callback_item != noone)
{
	if(active_build_panel != noone && active_build_panel != callback_item.build_select_panel) active_build_panel.visible = false;
	active_build_panel = callback_item.build_select_panel;
	active_build_panel.visible = true;
	
	if(
		locked_build_panel != noone
		&& active_build_panel != locked_build_panel
	) locked_build_panel.visible = false;
}