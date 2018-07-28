/// @description Update

// reset active build panel when no longer hovering over it.
if(
	active_build_panel != noone 
	&& !active_build_panel.hover
	&& active_build_panel.visible
	&& !hover
)
{
	active_build_panel.visible = false;
	active_build_panel = noone;
	
	// if there is a locked panel, make it visible again
	if(locked_build_panel != noone) locked_build_panel.visible = true;
}

event_inherited();