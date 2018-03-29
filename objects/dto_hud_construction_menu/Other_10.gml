/// @description Update

if(
	active_build_panel != noone 
	&& !active_build_panel.hover
	&& active_build_panel.visible
	&& !hover
)
{
	active_build_panel.visible = false;
	active_build_panel = noone;
}

event_inherited();