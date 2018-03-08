/// resets positions of outliner components
/// @arg outliner
var arg_outliner = argument0;

// calculate offsets
var astro_panels_h = 0;
var robot_panels_h= 0;
var a_count = 0;
var r_count = 0;
var c_count = 0;
with(obj_HUD_entity_panel)
{
	if(scr_instance_inherits(entity, obj_astronaut))
	{
		astro_panels_h += panel_height;
		a_count++;
	}
	else if(scr_instance_inherits(entity, obj_robot))
	{
		robot_panels_h += panel_height;
		r_count++;
	}
	else c_count++;
}
with(arg_outliner)
{
	tab_robot_top = tab_astro_top + tab_h + astro_panels_h;
	tab_cart_top = tab_robot_top + tab_h + robot_panels_h;
	astro_count = 0;
	robot_count = 0;
	cart_count = 0;
	with(obj_astronaut)
	{
		if(owner == macro_player) other.astro_count++;
	}
	with(obj_robot)
	{
		if(owner == macro_player) other.robot_count++;
	}
	with(obj_cart)
	{
		if(owner == macro_player) other.cart_count++;
	}
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