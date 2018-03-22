/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

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