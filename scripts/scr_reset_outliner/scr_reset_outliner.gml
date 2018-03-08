/// resets positions of outliner components
/// @arg outliner
var arg_outliner = argument0;

// calculate offsets
var astro_panels_h = 0;
var robot_panels_h= 0;
with(obj_HUD_entity_panel)
{
	if(scr_instance_inherits(entity, obj_astronaut)) astro_panels_h += panel_height;
	else if(scr_instance_inherits(entity, obj_robot)) robot_panels_h += panel_height;
}
with(arg_outliner)
{
	tab_robot_top = tab_astro_top + tab_h + astro_panels_h;
	tab_cart_top = tab_robot_top + tab_h + robot_panels_h;
}

// set offsets
var astro_panel_offset = 0;
var robot_panel_offset= 0;
var cart_panel_offset= 0;
with(obj_HUD_entity_panel)
{
	if(scr_instance_inherits(entity, obj_astronaut))
	{
		top = arg_outliner.tab_astro_top + arg_outliner.tab_h + astro_panel_offset;
		astro_panel_offset += panel_height;
	}
	else if(scr_instance_inherits(entity, obj_robot))
	{
		top = arg_outliner.tab_robot_top + arg_outliner.tab_h + robot_panel_offset;
		robot_panel_offset += panel_height;
	}
	else if(scr_instance_inherits(entity, obj_cart))
	{
		top = arg_outliner.tab_cart_top + arg_outliner.tab_h + cart_panel_offset;
		cart_panel_offset += panel_height;
	}
}